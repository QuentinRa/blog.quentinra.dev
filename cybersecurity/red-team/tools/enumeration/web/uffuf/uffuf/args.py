import argparse
import os
import sys

import uffuf.constants
import uffuf.filtering


def parse_arguments():
    parser = argparse.ArgumentParser(description="Unrestricted File Upload Fuzzer")

    http_options = parser.add_argument_group("HTTP OPTIONS")
    general_options = parser.add_argument_group("GENERAL OPTIONS")
    matcher_options = parser.add_argument_group("MATCHER OPTIONS")
    filter_options = parser.add_argument_group("FILTER OPTIONS")
    input_options = parser.add_argument_group("INPUT OPTIONS")
    output_options = parser.add_argument_group("OUTPUT OPTIONS")

    # HTTP Options
    http_options.add_argument("-H", metavar="header", dest="headers", action="append", help="Header 'Name: Value', separated by colon. Multiple -H flags are accepted.")
    http_options.add_argument("-u", dest="url", required=True, help="Target URL")
    parser.add_argument("-p", dest="param", help="Name of the file parameter.", required=True)
    parser.add_argument("-F", dest="file", help="Path to the file to upload.", required=True)
    parser.add_argument("-Fn", dest="filename", default=uffuf.constants.auto, help="Name of the file to upload (default: %(default)s).")
    parser.add_argument("-Ft", dest="filetype", default=uffuf.constants.auto, help="MIME types tested with the file (default: %(default)s).")
    parser.add_argument("--spoof", dest="should_spoof", action="store_true", help="Modify file contents to inject the MIME type.")

    # General Options
    general_options.add_argument("-V", "--version", action="version", version=uffuf.constants.version, help="Show version information")
    general_options.add_argument("-t", dest="threads", type=int, default=10, help="Number of concurrent threads (default: %(default)s)")
    general_options.add_argument("-v", dest="is_verbose", action="store_true", help="Verbose output")

    # Matcher Options
    matcher_options.add_argument("-mc", metavar="mc", default=uffuf.constants.default_status_codes, help="Match HTTP status codes, or 'all' for everything (default: %(default)s)")
    matcher_options.add_argument("-ml", metavar="ml", help="Match amount of lines in response")
    matcher_options.add_argument("-mr", metavar="mr", help="Match regexp")
    matcher_options.add_argument("-ms", metavar="ms", help="Match HTTP response size")
    matcher_options.add_argument("-mw", metavar="mw", help="Match amount of words in response")

    # Filter Options
    filter_options.add_argument("-fc", metavar="fc", help="Filter HTTP status codes from response")
    filter_options.add_argument("-fl", metavar="fl", help="Filter by amount of lines in response")
    filter_options.add_argument("-fr", metavar="fr", help="Filter regexp")
    filter_options.add_argument("-fs", metavar="fs", help="Filter HTTP response size")
    filter_options.add_argument("-fw", metavar="fw", help="Filter by amount of words in response")

    # Input Options
    input_options.add_argument("-w", dest="wordlist", help="Wordlist file path and (optional) keyword separated by colon. eg. '/path/to/wordlist:KEYWORD'", required=True)

    # Output Options

    return parser.parse_args()


def verify_arguments(args):
    data = type('ProgramData', (), {
        'file': args.file, 'param': args.param, 'threads': args.threads,
        'is_verbose': args.is_verbose, 'should_spoof': args.should_spoof
    })

    if args.url.startswith("http"):
        data.url = args.url
    else:
        # noinspection HttpUrlsUsage
        data.url = "http://" + args.url

    try:
        if ":" in args.wordlist:
            [data.wordlist,keyword] = args.wordlist.split(":")
            data.keyword = keyword
        else:
            data.wordlist = args.wordlist
            data.keyword = "FUZZ"

        with open(data.wordlist, 'r') as file:
            data.words = file.readlines()
    except FileNotFoundError:
        print(f"Error: Wordlist '{data.wordlist}' not found.")
        sys.exit(1)

    try:
        with open(args.file, 'rb') as file:
            data.file_content = file.read()
            if args.filetype == uffuf.constants.auto:
                import mimetypes
                mime_type, _ = mimetypes.guess_type(args.file)
                if mime_type is None:
                    mime_type = "application/octet-stream"
                data.filetype = mime_type
            else:
                data.filetype = args.filetype
    except FileNotFoundError:
        print(f"Error: File to upload '{args.file}' not found.")
        sys.exit(1)

    # compute filename
    if args.filename == uffuf.constants.auto:
        data.filename = os.path.basename(args.file)
    else:
        data.filename = args.filename

    if data.keyword not in data.filename and data.keyword not in data.filetype:
        print(f'Error: The keyword "{data.keyword}" was not found in either the filename or the filetype.')
        sys.exit(2)

    # computer headers
    data.headers = {}
    for header in args.headers or []:
        parts = header.split(":")
        data.headers[parts[0].strip()] = parts[1].strip()

    data.matcher = uffuf.filtering.FilteringHandler(False, args.mc, args.ml, args.mr, args.ms, args.mw)
    data.filter = uffuf.filtering.FilteringHandler(True, args.fc, args.fl, args.fr, args.fs, args.fw)

    return data
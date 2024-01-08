import argparse
import impl.constants


def parse_arguments():
    parser = argparse.ArgumentParser(description="Command Injection Request Encoder")
    commands_parser = parser.add_subparsers(title='subcommands', dest='command', required=True)
    command_crawl = commands_parser.add_parser('crawl', help='Crawl a website using link between pages.')
    command_host = commands_parser.add_parser('hosts', help='Add or update IP and domain in /etc/hosts')

    general_options = parser.add_argument_group("GENERAL OPTIONS")

    # General Options
    general_options.add_argument("-V", "--version", action="version", version=impl.constants.version, help="Show version information")

    # Add Command Options
    command_host.add_argument('ip', help='IP address to add/update')
    command_host.add_argument('domain', nargs='+', help='Domain(s) to add/update')
    command_host.add_argument('--merge', dest='merge', action='store_true', default=True, help='Lines are merged by IP after insertion (default=YES).')
    command_host.add_argument('--dry', dest='dry_run', action='store_true', help='If set, don\'t edit the host file (default=NO).')

    # Crawl Command Options
    command_crawl.add_argument('-u', dest='url', help='The target website URL.', required=True)
    command_crawl.add_argument('-t', metavar='threads', dest='threads', default=10, help='Number of threads (default=%(default)s).')
    command_crawl.add_argument('-o', metavar='output', dest='output_file', help='Write the output to a file.')
    command_crawl.add_argument('-k', dest='ssl_verify', default=True, action='store_false', help='Write the output to a file.')

    return parser.parse_args()


def verify_arguments(args):
    return args
import requests
import uffuf.constants


def execute_worker_task(args):
    """Worker function to consume words from the queue."""
    while not args.words_queue.empty():
        word = args.words_queue.get()
        if word is None:
            break
        process_word(args, word)
        args.words_queue.task_done()


def process_word(args, word):
    contents = args.file_content
    filetype = args.filetype.replace(args.keyword, word)
    if args.should_spoof:
        if filetype in uffuf.constants.mimetypes_to_bytes:
            contents = uffuf.constants.mimetypes_to_bytes[filetype] + contents
        else:
            print(f'[WARN] Cannot spoof file: MIME type {filetype} is not supported.')

    files = {
        args.param: (
            args.filename.replace(args.keyword, word),
            contents, filetype
        )
    }

    # print(f'[Testing Payload For {word}] ', files)
    try:
        response = requests.post(args.url, files=files, headers=args.headers)
        content = response.text
        res_code = response.status_code
        res_size = int(response.headers.get('Content-Length'))
        lines_count = len(content.splitlines())
        words_count = len(content.split())

        # remove not matching or filtered
        if not args.matcher.is_valid(res_code, lines_count, content, res_size, words_count):
            return
        if not args.filter.is_valid(res_code, lines_count, content, res_size, words_count):
            return

        print(f'{word:<25} [Status: {res_code}, Size: {res_size}, Words: {words_count}, Lines: {lines_count}]')

        if args.is_verbose:
            line = content.split('\n')[0]
            print(f'{"":<25} [INFO] Output Content: {line}\n')
    except Exception as e:
        print(f'{word:<25} [Error {e}]')
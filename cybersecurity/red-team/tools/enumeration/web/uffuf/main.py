#!/usr/bin/env python3
import queue
import pyfiglet

import uffuf.args
import uffuf.constants
import uffuf.core
import uffuf.worker


def main():
    args = uffuf.args.parse_arguments()
    args = uffuf.args.verify_arguments(args)

    print(f"""
    ________________________________________________

    {pyfiglet.figlet_format("File Upload Fuzz")}
        v{uffuf.constants.version}
    ________________________________________________

        URL            ::=  {args.url}
        Wordlist       ::=  {args.wordlist}
        Threads        ::=  {args.threads}
        Header(s)      ::=  {args.headers}
        File           ::=  (name: {args.filename}, type: {args.filetype}, path: {args.file})""")

    for filter in [args.matcher, args.filter]:
        if filter.status_code is not None and filter.status_code != uffuf.constants.default_status_codes:
            print(f'        {filter.name:<14} ::=  Response status: {filter.status_code}')
        if filter.line_count is not None:
            print(f'        {filter.name:<14} ::=  Response lines: {filter.line_count}')
        if filter.word_count is not None:
            print(f'        {filter.name:<14} ::=  Response words: {filter.word_count}')
        if filter.size is not None:
            print(f'        {filter.name:<14} ::=  Response size: {filter.size}')

    print(f"""
    ________________________________________________
    """)

    # Create a queue to hold words from the wordlist
    args.words_queue = queue.Queue()
    words = [word.strip() for word in args.words]
    for word in words:
        args.words_queue.put(word)

    # Process everything
    uffuf.worker.start_threads(
        uffuf.core.execute_worker_task,
        args
    )


if __name__ == "__main__":
    main()

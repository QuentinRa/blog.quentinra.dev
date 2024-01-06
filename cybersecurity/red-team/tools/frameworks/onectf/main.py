#!/usr/bin/env python3
import impl.args
import impl.constants
import impl.core
import impl.worker
import jobs.crawl
import jobs.hosts


def main():
    args = impl.args.parse_arguments()
    args = impl.args.verify_arguments(args)

    print(f"onectf v{impl.constants.version}\n")

    if args.command == 'crawl':
        jobs.crawl.init(args)
        try:
            impl.worker.start_threads(jobs.crawl.execute_worker_task, args, args.links)
        except KeyboardInterrupt:
            print()
        finally:
            jobs.crawl.done(args)
    elif args.command == 'hosts':
        jobs.hosts.do_job(args)
    else:
        raise Exception("Command not supported.")


if __name__ == "__main__":
    main()

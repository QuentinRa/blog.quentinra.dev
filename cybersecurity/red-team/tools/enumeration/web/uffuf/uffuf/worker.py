import threading


def start_threads(worker_function, args):
    # Start worker threads
    threads = []
    threads_range = range(min(args.threads, len(args.words)))
    for _ in threads_range:
        t = threading.Thread(target=worker_function, args=(args,))
        t.start()
        threads.append(t)

    # Wait for all tasks in the queue to be processed
    args.words_queue.join()

    # Stop workers by putting None in the queue for each thread
    for _ in threads_range:
        args.words_queue.put(None)

    # Join all threads
    for t in threads:
        t.join()

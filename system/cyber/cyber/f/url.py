# Import the libraries we downloaded earlier
# if you try importing without installing them, this step will fail
from bs4 import BeautifulSoup
import requests

# replace testurl.com with the url you want to use.
# requests.get downloads the webpage and stores it as a variable

# this parses the webpage into something that beautifulsoup can read over
# lxml is just the parser for reading the html

# this is the line that grabs all the links # stores all the links in the links variable

for i in range(1,99,2):
		html = requests.get('http://10.10.36.205:8000/api/'+str(i)).json()
		print(html)

#for link in links:
    # prints each link
#    print(link)
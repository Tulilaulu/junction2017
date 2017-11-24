from bottle import route, run, template
from urllib2 import Request, urlopen, URLError
import requests

@route('/data/')
def index():
    data = {"password": "ratkaisutalkootapahtuma"}
    r = requests.post('https://fortum.hackjunction.com/api/locations/', json=data).text
    try:
        print r
        return template('<pre>{{r}}</pre>!', r=r)
    except URLError, e:
        print 'No kittez. Got an error code:', e

run(host='localhost', port=8080)

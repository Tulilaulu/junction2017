from bottle import route, run, template
from urllib2 import Request, urlopen, URLError
import requests

@route('/data/')
def index():
    data = {"password": "ratkaisutalkootapahtuma"}
    r = requests.post('https://fortum.hackjunction.com/api/locations/'+'3', data=data).text
    try:
#        response = urlopen(r)
#        a = response.read()
        print r
        return template('<pre>{{r}}</pre>!')
    except URLError, e:
        print 'No kittez. Got an error code:', e    

run(host='localhost', port=8080)

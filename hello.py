from bottle import route, run, template
from urllib2 import Request, urlopen, URLError
import requests
import json

@route('/data/')
def index():
    data = {"password": "ratkaisutalkootapahtuma"}
    r = json.loads(requests.post('https://fortum.hackjunction.com/api/locations/', json=data).text)
    print r
    try:
        for item in r:
            print "Getting "+str(item['location'])
            i = requests.post('https://fortum.hackjunction.com/api/locations/'+str(item['location']), json=data).text
            r.append(i)
            if (item['location'] > 3):
                break
        return template('<pre>{{r}}</pre>!', r=r)
    except URLError, e:
        print 'No kittez. Got an error code:', e

run(host='localhost', port=8080)

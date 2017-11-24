from bottle import route, run, template
from urllib2 import Request, urlopen, URLError
import requests
import json

@route('/data/')
def index():
    data = {"password": "ratkaisutalkootapahtuma"}
    r = json.loads(requests.post('https://fortum.hackjunction.com/api/locations/', json=data).text)
    my_dict={}
    try:
        print r
#        print "Getting "+str(r[0]['location'])
#        i = requests.post('https://fortum.hackjunction.com/api/locations/'+str(r[0]['location']), json=data).text
#        r.append(i)
        my_dict['r'] = r
        return template('template.tpl', **my_dict)
    except URLError, e:
        print 'No kittez. Got an error code:', e

run(host='localhost', port=8080)

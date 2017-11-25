from bottle import route, run, template, static_file
from urllib2 import Request, urlopen, URLError
import requests
import json

@route('/kasvi/<picture>')
def serve_pictures(picture):
    return static_file(picture, root='kasvi')

@route('/')
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

@route('/data/<user>')
def index(user):
    r = []
    for line in open('daily/%s.csv' % (user,)).readlines()[1:]:
        timestamp, power = line.split(' ;')
        r.append([timestamp, float(power)])
    return {'data': r}

run(host='localhost', port=8080)

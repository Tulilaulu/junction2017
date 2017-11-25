from bottle import route, run, template, static_file
from collections import defaultdict
from datetime import datetime, timedelta
from urllib2 import Request, urlopen, URLError
import time
import requests
import json

def from_str(s):
    return datetime.strptime(s, '%Y-%m-%d %H:%M:%S')

@route('/kasvi/<picture>')
def serve_pictures(picture):
    return static_file(picture, root='kasvi')

@route('/js/<script>')
def serve_jaesae(script):
    return static_file(script, root='js')

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
    user = int(user)
    r = []
    for line in open('daily/%s.csv' % (user,)).readlines()[1:]:
        timestamp, power = line.split(' ;')
        ds = from_str(timestamp)
        r.append(['Date(%d, %d, %d)' % (ds.year, ds.month - 1, ds.day), float(power)])
    return {'data': r, 'locationdata': filter(lambda x: x['location'] == user, json.load(open('locations.json')))[0]}

@route('/avg/<city>')
def index(city):
    r1 = defaultdict(lambda: [])
    r2 = defaultdict(lambda: [])
    for d in json.load(open('locations.json')):
        if d['city'] == city:
            for line in open('daily/%s.csv' % (d['location'],)).readlines()[1:]:
                timestamp, power = line.split(' ;')
                r1[timestamp].append(float(power))
                r2[timestamp].append(float(power) / d['squaremeters'])

    res = []
    for k in r1.iterkeys():
        av1 = sum(r1[k])/len(r1[k])
        av2 = sum(r2[k])/len(r2[k])
        res.append([k, av1, av2])
    res.sort()
    return {'data': map(lambda x: ['Date(%d, %d, %d)' % (from_str(x[0]).year, from_str(x[0]).month - 1, from_str(x[0]).day), x[1], x[2]], res)}


run(host='0.0.0.0', port=8080)

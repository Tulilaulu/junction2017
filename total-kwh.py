from datetime import datetime, timedelta
import sys

integ = timedelta(minutes=10)
half = integ / 2

def from_str(s):
    return datetime.strptime(s, '%Y-%m-%d %H:%M:%S')

def to_str(ts):
    return ts.strftime('%Y-%m-%d %H:%M:%S')

fname = sys.argv[1]

data = open(fname).readlines()[1:]

line = data[0]
data = data[1:]

prev_ts, prev_power = line.split(' ;')
prev_ts = from_str(prev_ts)
prev_power = float(prev_power)

hour_start = prev_ts
next_check = prev_ts + integ
joules = 0

for line in data:
    timestamp, power = line.split(' ;')
    timestamp = from_str(timestamp)
    power = float(power)

    joules += prev_power * (timestamp - prev_ts).total_seconds()

    prev_ts, prev_power = timestamp, power

print(joules / (60*60) / 1000)
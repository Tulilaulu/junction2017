from datetime import datetime, timedelta
import sys

integ = timedelta(minutes=60*24)
half = integ / 2

def from_str(s):
    return datetime.strptime(s, '%Y-%m-%d %H:%M:%S')

def to_str(ts):
    return ts.strftime('%Y-%m-%d %H:%M:%S')

fname = sys.argv[1]

data = open(fname).readlines()[1:]

# ugly hack
while True:
    line = data[0]
    data = data[1:]

    prev_ts, prev_power = line.split(' ;')
    prev_ts = from_str(prev_ts)
    prev_power = float(prev_power)

    if prev_power < 20000:
        break

hour_start = prev_ts
next_check = prev_ts.replace(day=prev_ts.day + 1, hour=0, minute=0, second=0)
joules = 0

print("datetime;p")
for line in data:
    timestamp, power = line.split(' ;')
    timestamp = from_str(timestamp)
    power = float(power)

    if power > 20000:
        continue

    joules += prev_power * (timestamp - prev_ts).total_seconds()

    if timestamp > next_check:
        #print((hour_start, joules))
        print("%s ;%s" % (hour_start.replace(hour=0, minute=0, second=0), joules / (timestamp - hour_start).total_seconds()))
        hour_start = timestamp
        joules = 0
        next_check = hour_start + integ

    prev_ts = timestamp
    prev_power = power

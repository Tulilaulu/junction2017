#!/usr/bin/env bash
mkdir -p data

for f in $(curl -H "Content-Type: application/json" -X POST -d '{"password":"ratkaisutalkootapahtuma"}'  https://fortum.hackjunction.com/api/locations | grep location | tr -d , | awk '{print $NF}'); do
    curl -H "Content-Type: application/json" -X POST -d '{"password":"ratkaisutalkootapahtuma"}'  https://fortum.hackjunction.com/api/locations/$f > data/$f.csv
done

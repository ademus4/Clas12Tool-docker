#!/usr/bin/env bash
docker run -it --rm \
    -v /lscratch/:/lscratch/ \
    -v /home/adamt/work/:/local_work/ \
    -w /work/ \
    --user $(id -u):$(id -g) \
    clas12tools:test \
    bash

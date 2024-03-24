#!/bin/bash

perf record -g -o perf.data.g dd if=/dev/zero of=/dev/null count=1000000
perf report -i perf.data.g --stdio > call_graph.txt

perf script -i perf.data.g | ./stackcollapse-perf.pl | ./flamegraph.pl > flamegraph.svg
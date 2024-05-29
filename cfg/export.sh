#!/bin/bash


export FLAMEGRAPH_PATH="$(pwd)/files/flamegraph.pl"
export STACKCOLLAPSE_PATH="$(pwd)/files/stackcollapse-perf.pl"

bcctools=/usr/share/bcc/tools
bccexamples=/usr/share/bcc/examples
export PATH=$bcctools:$bccexamples:$PATH
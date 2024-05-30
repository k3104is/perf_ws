#!/bin/bash


export FLAMEGRAPH_PATH="$(pwd)/files/flamegraph.pl"
export STACKCOLLAPSE_PATH="$(pwd)/files/stackcollapse-perf.pl"

LOCAL_BIN_PATH="/root/.local/bin"
export PATH=$LOCAL_BIN_PATH:$PATH
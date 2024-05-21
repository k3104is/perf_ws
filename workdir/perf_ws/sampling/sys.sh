#!bin/bash

DURATION="10"
OUT_DIR="./tmp"
OUT_FILE="${OUT_DIR}/sys.data"
STACK_FILE="${OUT_DIR}/sys.stack"
SVG_FILE="${OUT_DIR}/sys.svg"

perf record -F 99 -a -g -o ${OUT_FILE} sleep ${DURATION}
perf script -i ${OUT_FILE} > ${STACK_FILE}
perf script -i ${OUT_FILE} | ${STACKCOLLAPSE_PATH} | ${FLAMEGRAPH_PATH} > ${SVG_FILE}

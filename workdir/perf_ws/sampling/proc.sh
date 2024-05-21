#!bin/bash

OUT_DIR="./tmp"
OUT_FILE="${OUT_DIR}/proc.data"
STACK_FILE="${OUT_DIR}/proc.stack"
SVG_FILE="${OUT_DIR}/proc.svg"
CMD="dd if=/dev/zero of=/dev/null count=1000000"

perf record -F 99 -g -o ${OUT_FILE} ${CMD}
perf script -i ${OUT_FILE} > ${STACK_FILE}
perf script -i ${OUT_FILE} | ${STACKCOLLAPSE_PATH} | ${FLAMEGRAPH_PATH} > ${SVG_FILE}

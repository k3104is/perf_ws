#!bin/bash

OUT_DIR="./tmp"
OUT_FILE="${OUT_DIR}/proc_perf.data"
CMD="dd if=/dev/zero of=/dev/null count=1000000"

perf record -F 99 -g -o ${OUTFILE} ${CMD}
perf script report -i ${OUTFILE} 
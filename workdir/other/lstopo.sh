#!/bin/bash

OUT_DIR="./tmp"
SVG_FILE="${OUT_DIR}/lstopo.svg"

lstopo --of svg > ${SVG_FILE}
#!/bin/bash

# time:実行時間を計測
# CPUコアに負荷
# コア:4, タイムアウト:5[s]
echo stress cpu
time stress -c 4 -t 5 -q

# HDDのR/Wアクセス処理
echo stress hdd
time stress --hdd 2 -t 5 -q

# スリープ処理
echo sleep
time sleep 5
#!/bin/bash
# システムコールの発行状況を表示
# --t:us単位のタイムスタンプ
# -T:呼び出し前後のタイムスタンプの時間差からカーネル内でのシステムコール処理時間も表示
# require:strace
echo display time of call
strace -tt -T ls .

echo display exe time order
strace -c ls .
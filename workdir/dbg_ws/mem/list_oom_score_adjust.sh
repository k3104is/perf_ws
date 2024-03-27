#!/bin/bash
# プロセス名順にOOM killerの優先度を確認
# 初期値：0、最大優先度：-1000(強制停止の対象外)
for dir in /proc/[0-9]*; do
  echo "`cat $dir/comm` : `cat $dir/oom_score_adj`"
done | sort | uniq
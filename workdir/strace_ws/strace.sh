#!/bin/bash
# ptraceインタフェースを介したブレークポイントベースのトレーシング
# すべてのシステムコールの開始とリターンにブレークポイントをセットする
# 侵入的であり、システムコールをよく呼び出すアプリケーションでは、パフォーマンスが桁違いに悪くなる
# perf, Ftrace, BCC, bpftraceなどのトレーサーはバッファを用いてオーバーヘッドを大幅に削減している
echo "with strace"
strace -c dd if=/dev/zero of=/dev/null bs=1k count=50k

echo "without strace"
dd if=/dev/zero of=/dev/null bs=1k count=50k
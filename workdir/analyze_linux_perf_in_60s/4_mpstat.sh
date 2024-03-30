#!/bin/bash

# CPU間のバランス。
# ひとつのPCだけがビジー-> スレッドのスケーリングに問題あり
mpstat -P all 1
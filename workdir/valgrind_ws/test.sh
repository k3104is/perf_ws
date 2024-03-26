#!/bin/bash

gcc hello.c -o hello-ok.out
gcc hello.c -DNG -o hello-ng.out

valgrind ./hello-ok.out > ok.log 2>&1
valgrind ./hello-ng.out > ng.log 2>&1
valgrind --leak-check=full ./hello-ng.out > ng-leak.log 2>&1
valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes ./hello-ng.out > ng-leak-detail.log 2>&1
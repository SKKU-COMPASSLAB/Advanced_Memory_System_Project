#!/bin/bash

python3 run.py "m1_RCD16_RP16"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/DDR4.h" "203" "        {2400, (400.0/3)*9, (3/0.4)/9, 4, 4, 6, 2, 16, 20, 20, 12, 39, 55, 9, 3, 9, 18, 0, 0, 0, 0, 0, 6, 8, 0, 7, 0, 0},"
make -j4
sleep 10
python3 run.py "m1_RCD20_RP20"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/DDR4.h" "203" "        {2400, (400.0/3)*9, (3/0.4)/9, 4, 4, 6, 2, 16, 24, 24, 12, 39, 55, 9, 3, 9, 18, 0, 0, 0, 0, 0, 6, 8, 0, 7, 0, 0},"
make -j4
sleep 10
python3 run.py "m1_RCD24_RP24"
sleep 3

make clean
python3 modify.py "./src/DDR4.h" "203" "        {2400, (400.0/3)*9, (3/0.4)/9, 4, 4, 6, 2, 16, 16, 16, 12, 39, 55, 9, 3, 9, 18, 0, 0, 0, 0, 0, 6, 8, 0, 7, 0, 0},"
make -j4
sleep 10

echo "Done"

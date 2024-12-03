#!/bin/bash

python3 run.py "m2_config1"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/DDR4.h" "153" "        {4<<10,  8, {0, 0, 4, 8, 1<<14, 1<<10}},"
make -j4
sleep 10
python3 run.py "m2_config2"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/DDR4.h" "153" "        {4<<10,  8, {0, 0, 4, 16, 1<<13, 1<<10}},"
make -j4
sleep 10
python3 run.py "m2_config3"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/DDR4.h" "153" "        {4<<10,  8, {0, 0, 4, 4, 1<<15, 1<<10}},"
make -j4
sleep 10

echo "Done"
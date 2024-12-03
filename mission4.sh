#!/bin/bash

python3 run.py "m4_open"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/Scheduler.h" "219" "    } type = Type::Closed;"
make -j4
sleep 10
python3 run.py "m4_close"
sleep 3

make clean
python3 modify.py "./src/Scheduler.h" "219" "    } type = Type::Opened;"
make -j4
sleep 10

echo "Done"
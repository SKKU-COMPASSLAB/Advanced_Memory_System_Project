#!/bin/bash

python3 run.py "m3_RoBaRaCoCh"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/Memory.h" "81" "    } type = Type::ChRaBaRoCo;"
make -j4
sleep 10
python3 run.py "m3_ChRaBaRoCo"
sleep 3

echo "Re-compile, Wait"
make clean
sleep 3
python3 modify.py "./src/Memory.h" "81" "    } type = Type::RoBaRaCoCh;"
make -j4
sleep 10

echo "Done"

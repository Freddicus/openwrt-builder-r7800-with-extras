#!/bin/bash
git pull
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
bash
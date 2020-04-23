#!/bin/bash

cd ~/android/lineage
cd frameworks

cd base
git add .
git commit -m patch
cd ..

cd opt/net/wifi
git add .
git commit -m patch
cd ../../../

cd ..

cd kernel/nvidia/cypress-fmac
git add .
git commit -m patch
cd ..

cd

#!/bin/bash

cd ~/android/lineage
cd frameworks

cd base
git add .
git commit -m patch
cd ..

cd native
git add .
git commit -m patch
cd ..

cd ..
cd vendor

cd lineage
git add .
git commit -m patch
cd ..

cd nvidia
git add .
git commit -m patch
cd ..

cd

#!/bin/bash

cd /root/android/lineage
repo forall -c ‘git reset --hard’

cd .repo/local_manifests
git pull

cd ../..

repo sync

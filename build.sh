#!/bin/bash
# Create zip files to be inserted
cd data
./genfiles.sh
cd ..
docker build .
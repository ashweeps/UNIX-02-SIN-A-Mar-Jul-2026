#!/bin/bash
set -x
mkdir mydirectory 
touch mydirectory/myfile 
ls -l mydirectory
set +x
bash -x blackhatbash2.sh
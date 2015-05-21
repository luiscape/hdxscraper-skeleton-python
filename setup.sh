#!/bin/bash

#
# Installing dependencies.
#
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt

#
# Running setup scripts.
#
python tool/scripts/setup/
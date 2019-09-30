#!/bin/bash

python3 manage.py flush --no-input
python3 manage.py migrate --fake-initial
python3 manage.py collectstatic --no-input --clear

exec "$@"

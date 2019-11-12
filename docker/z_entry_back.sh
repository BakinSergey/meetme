#!/bin/bash

python ./meetme/manage.py makemigrations --settings=config.settings.prod
python ./meetme/manage.py migrate --settings=config.settings.prod
python ./meetme/manage.py collectstatic --no-input

sleep 10s

python ./meetme/manage.py runserver 0.0.0.0:8000 --settings=config.settings.prod

"$@"
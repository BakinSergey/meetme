#!/bin/bash

psql -d meet_db -U meet_user < tmp/load_meet_db_dump.sql

"$@"
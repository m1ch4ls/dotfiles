#!/bin/bash

BIRTHDAY=557445600 # date --date='1987-09-01' '+%s'
EXPECTED_AGE=2393582400 # 75.9 for male in CZ

TODAY=$(date +%s)

AGE=$(($TODAY - $BIRTHDAY))
LEFT=$(($EXPECTED_AGE - $AGE))

echo "<b>"`LC_NUMERIC='cs_CZ.UTF-8' numfmt --grouping $(($LEFT / 86400))`"</b>"" days"
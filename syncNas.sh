#!/usr/bin/env bash

rsync -avhrWAHxv \
--exclude '.DS_Store' \
--exclude 'Podcasts' \
--numeric-ids --progress --inplace --delete \
--log-file=syncNas.log \
/Volumes/Storage/Music admin@nas.local:/share/Multimedia


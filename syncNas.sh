#!/usr/bin/env bash

rsync -avhrWAHxv \
--exclude '.DS_Store' \
--exclude 'Podcasts' \
--exclude 'Vogelstimmen' \
--numeric-ids --progress --inplace --delete \
--log-file=syncNas.log \
--delete
/Volumes/Storage/Music admin@nas.local:/share/Multimedia


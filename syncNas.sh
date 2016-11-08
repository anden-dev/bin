#!/usr/bin/env bash

rsync -avhrWAHxv --exclude '.DS_Store' --exclude '/Volumes/Storage/Music/Podcasts/*' --numeric-ids --progress --inplace --delete --log-file=syncNas.log /Volumes/Storage/Music admin@nas.local:/share/Multimedia


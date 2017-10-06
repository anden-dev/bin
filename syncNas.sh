#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

>$DIR/last_syncNas.log

rsync -avhrWAHxv \
--exclude '.DS_Store' \
--exclude 'Podcasts/' \
--exclude 'Cesko Mix/' \
--exclude '*Vogelstimmen*' \
--exclude '*(SACD)*' \
--exclude '*(MFSL)*' \
--exclude '*Wagner*' \
--exclude '*Mozart*' \
--size-only \
--numeric-ids --progress --inplace --delete \
--log-file=$DIR/last_syncNas.log \
/Volumes/Storage/Music admin@nas.local:/share/Multimedia \
--delete-before --delete-excluded 
#--exclude 'Compilations/' \

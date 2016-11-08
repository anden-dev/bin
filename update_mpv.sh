#!/bin/bash

export LC_ALL=en_US.UTF-8 ; export LANG=en_US.UTF-8

brew rm mpv

brew install --HEAD --with-bundle --with-bluray-support --with-libdvdread --with-little-cms2 --with-lua --with-bundle mpv

brew linkapps mpv 

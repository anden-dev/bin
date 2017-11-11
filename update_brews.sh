#!/bin/bash
echo "updating brews"
brew update
echo "upgrading installed brews (if needed)"
brew upgrade
echo "cleaning up"
brew cleanup
echo "upgrading casks (if needed)"
brew cu -a -y

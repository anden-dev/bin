#!/usr/bin/env bash

logger=/usr/bin/logger

echo "mactex update"
sudo tlmgr update --self 2>&1 #| $logger -t updateLatex.self
sudo tlmgr update --all 2>&1 #| $logger -t updateLatex.update
 




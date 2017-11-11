#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

touch $script_dir/.ensured_casks.txt
touch $script_dir/.ensured_brews.txt

# this lists will be ensured
tap_list=(
buo/cask-upgrade
caskroom/cask
mpv-player/mpv
)
cask_list=($(grep -v '#' $script_dir/.ensured_casks.txt | grep -v "^$"))
brew_list=($(grep -v '#' $script_dir/.ensured_brews.txt| grep -v "^$"))

echo "ensuring brew and brew related setup"

echo -n "brew is installed... "
if [[ $(which brew) == "/usr/local/bin/brew" ]]; then
    echo "ok."
else
    echo
    echo "installing now"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        echo "install failed"
        echo "you might want to check: https://brew.sh/"
        exit 1
    else
        echo "ok."
    fi
fi
installed_brews="$(brew list)"

for brew in ${brew_list[@]}; do
    echo -n "brew ${brew}... "
    echo $installed_brews | grep -w "${brew}" >/dev/null
    if [[ $? != 0 ]]; then
        echo
        brew install $brew
        if [[ $? != 0 ]]; then
            echo "failed."
            exit 1
        fi
    fi
    echo "ok."
done

installed_taps="$(brew tap)"

for tap in ${tap_list[@]}; do
    echo -n "tap on ${tap}... "
    echo $installed_taps | grep -w "${tap}" >/dev/null
    if [[ $? != 0 ]]; then
        echo
        brew tap $tap
        if [[ $? != 0 ]]; then
            echo "failed."
            exit 1
        fi
    fi
    echo "ok."
done

installed_casks="$(brew cask list)"

for cask in ${cask_list[@]}; do
    echo -n "cask ${cask}... "
    echo $installed_casks | grep -w "${cask}" >/dev/null
    if [[ $? != 0 ]]; then
        echo
        brew cask install $cask
        if [[ $? != 0 ]]; then
            echo "failed."
            exit 1
        fi
    fi
    echo "ok."
done

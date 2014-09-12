#!/bin/sh
# Setup a machine for Sublime Text
set -x

sublime_dir=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# link subl alias
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$DOT/bin/subl"

# backup previous User folder if it exists
if [ -d "$sublime_dir" ]; then
  rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.backup
  cp -rf "$sublime_dir" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User.backup
fi

if [ ! -d "$sublime_dir" ]; then
  mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
fi

#Install Package Control
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone git://github.com/wbond/sublime_package_control.git Package\ Control
cd Package\ Control
git checkout python3

# Grab the Putty scheme
mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Color Schemes"
cd "$sublime_dir/Color Schemes"
curl -O https://raw.github.com/geoffgarside/TextMate-Themes/master/Putty.tmTheme

#Grab SublimeLinter
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
git clone https://github.com/SublimeLinter/SublimeLinter.git
cd SublimeLinter
git checkout sublime-text-3
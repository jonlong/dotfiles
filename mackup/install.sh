#!/bin/sh
#
# mackup
#
# Install mackup

# Check for mackup
if [ ! -d $mackup_dir ]; then
  echo "Installing mackup for you."
  brew install mackup
fi

exit 0
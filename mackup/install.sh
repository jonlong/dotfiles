#!/bin/sh
#
# mackup
#
# Install mackup

mackup_dir="$PROJECTS/mackup"

# Check for mackup
if [ ! -d $mackup_dir ]; then
  echo "Installing mackup for you."
  git clone git@github.com:jonlong/mackup.git $mackup_dir
fi

exit 0
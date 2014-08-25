#!/bin/sh
#
# mackup
#
# Install mackup

backup_dir="$DOT/apps";
app_settings_repo="git@github.com:jonlong/app-settings.git"

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Check for mackup
if [ ! -d $mackup_dir ]; then
  echo "Installing mackup for you."
  brew install mackup
fi

# If the directory exists, ask the user what to do
if [ -d $backup_dir ]; then

  user "Directory already exists: ${backup_dir}, what do you want to do? [s]kip, [o]verwrite?"
  read -n 1 action

  case "$action" in
    o )
      overwrite=true;;
    s )
      skip=true;;
    * )
      ;;
  esac

  if [ "$skip" == "true" ]
  then
    success "skipped app preference installation"
  fi

  if [ "$overwrite" == "true" ]
  then
    rm -rf $backup_dir
    success "removed $backup_dir"
  fi
fi

if [ ! -d $backup_dir ] || [ "$overwrite" == "true" ]
then
  info "installing app preferences"
  echo ''
  git clone $app_settings_repo $backup_dir
fi

info "restoring app preferences"
echo ''
# No need to prompt user, Mackup will handle this
mackup restore

exit 0



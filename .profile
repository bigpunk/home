#!/bin/bash

# Common shell environment and configuration

# For now, you must list all of your profile pieces here in whatever order
# they need:
source ~/.profile.d/hostname
source ~/.profile.d/locale
source ~/.profile.d/arrayutil
source ~/.profile.d/sbin_path
source ~/.profile.d/home_path
source ~/.profile.d/pager
source ~/.profile.d/editor
source ~/.profile.d/term
source ~/.profile.d/dircolors

# Put Ruby Gems in homedir to avoid need for global sudo to install.
# This was initially done for cocoapods suppport.
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# TODO: use github.com/jcorbin/deporder once it's ready

# On most systems .bash_profile is only used for login shells where you
# enter your user name/password.  .bashrc is used for non-login shells.
# In theory this lets you display different information when you
# login to a machine.  On MacOS login shells are used everytime by default.

# Given the complicated relationship between profile and shell rc,
# and given the assumption "you never don't want your profile setup in an
# interactive shell":
# - each shell profile (e.g. .bash_profile) sources .profile
# - each shell rc (e.g. .bashrc) sources .profile if _PROFILE_LOADED is not
#   set
# - TODO: we could do even better with further compiler support ala
#   github.com/jcorbin/home:
#   - the compiled profile could set define this to a content hash
#   - shell rc could then "reload if modified"
#   - that core "reload if modified" function could also be ran by existing
#     shells lieu of restarting (either at the user's behest, or
#     automagically).
_PROFILE_LOADED=$(date +%s)
export _PROFILE_LOADED

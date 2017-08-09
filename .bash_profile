[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# add go path for go coding
export GOPATH=$HOME/Coding/go

#add cassandra home
export CASSANDRA_HOME=/Users/o/apache-cassandra-2.1.11

# added by Anaconda 1.6.1 installer
export PATH="/Users/o/anaconda/bin:$PATH"

# add go bins to PATH
export PATH=$PATH:$GOPATH/bin

# Added by Canopy installer on 2013-07-21
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/o/Library/Enthought/Canopy_32bit/User/bin/activate

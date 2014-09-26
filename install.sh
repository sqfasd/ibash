#!/bin/bash
readonly PROGDIR=$(readlink -m $(dirname $0))
readonly BASH_IT=$HOME/.ibash

test -L $BASH_IT && rm $BASH_IT
test -d $BASH_IT && mv $BASH_IT ${BASH_IT}.bak
ln -s $PROGDIR $BASH_IT

echo "export BASH_IT=$BASH_IT" > $HOME/.bash_profile
echo "source $BASH_IT/ibash.sh" >> $HOME/.bash_profile

#!/bin/bash -e

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $SCRIPTDIR/../.git/hooks
cp hooks/* $SCRIPTDIR/../.git/hooks/
chmod +x $SCRIPTDIR/../.git/hooks/*

echo "Successfully configured Git Hooks!"
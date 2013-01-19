#!/bin/bash

set -e

STDLIB=$(go list std | grep -v cmd | grep -v 'archive/tar' | egrep -v '^crypto$')
WORK=$(mktemp -d)
for PKG in $STDLIB; do
	mkdir -p $WORK/$(dirname $PKG)
	gocov test $PKG > $WORK/$PKG.json	
done

#! /usr/bin/env bash

# Thanks to @al. on Stack Overflow:
# https://stackoverflow.com/posts/1638397/revisions
# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

# Update the SOW hash with the real md5 hash of the SOW markdown. Then publish
# to PDF.
sed "/sow_hash/s/$/ `md5sum $1 | cut -c -8`/" $1 \
	| pandoc --template=${SCRIPTPATH}/template.tex \
	-o `echo $1 | sed "s/md/pdf/"`


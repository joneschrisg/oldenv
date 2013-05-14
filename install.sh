#!/bin/bash

diff_tmpfile=`mktemp --tmpdir env-install-diff.XXXXXX`
trap "rm -f $diff_tmpfile" EXIT

for f in `find . -type f \
    -not -path $0 \
    -not -path './.gitignore' -not -path './.git/*' -not -path './.git' \
    -not -name '*README*' \
    -printf "%P\n"`; do

    src=`realpath $f`
    dest="`realpath ~`/$f"
    if [[ -e $dest ]]; then
        dest=`realpath ~/$f`
        if [[ $src == $dest  ]]; then 
            echo $f is already installed
            continue
        fi

        echo $f already exists
        diff -U 8 $src $dest 2>&1 > $diff_tmpfile
        code=$?
        if [[ $code == 0 ]]; then
            echo $src and $dest have the same content
        elif [[ $code == 1 ]]; then
            echo $src and $dest differ:
            cat $diff_tmpfile
        elif [[ $code == 2 ]]; then
            echo Something went wrong comparing $src and $dest.  Output from diff: 1>&2
            cat $diff_tmpfile
            exit 1
        fi

        read -p "$dest is in the way.  Remove it? [Yes/no] "
        if [[ $REPLY != "Yes" ]]; then
            echo OK, not removing old file
            continue
        fi
        rm $dest
    fi

    dest_dir=`dirname $dest`
    if [[ ! -d $dest_dir ]]; then
        read -p "$dest_dir does not exist.  Create it? [Yes/no] "
        if [[ $REPLY != "Yes" ]]; then
            echo OK, not creating directory
            continue
        fi
        mkdir -p $dest_dir
    fi

    cp -s $src $dest
done

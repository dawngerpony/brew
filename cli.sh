#!/usr/bin/env bash


function usage {
        echo "Usage: $(basename $0) <github username>" 2>&1
        exit 1
}

if [[ ${#} -eq 0 ]]; then
   usage
fi


error=0

for cmd in "git" "brew"; do
    if ! command -v "${cmd}" &> /dev/null
    then
        echo "${cmd} could not be found, please install it"
        error=1
    fi
done

if [ "${error}" != "0" ]; then
    exit "${error}"
fi

user=$${1}
url="git@github.com:${1}/brew.git"
dir="/tmp/brew"

if [ ! -d "$dir" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    echo "Cloning ${url}"
    git clone ${url} ${dir}
    ls -ld ${dir}
else
    cd ${dir}
    git pull
fi

cd ${dir}
./run.sh

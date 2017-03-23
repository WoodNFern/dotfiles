#!/usr/bin/env bash

##
## Uninstalls the scripts from $HOME by removing the symlinks.
##

sourceDir="src/_*"

##
## Removes link from target directory.
##
## @param $1 source script
## @param $2 target direcotry
##
function removeFile {
    targetFile="${1/src\//}"
    targetFile="${targetFile/_/.}"
    target="${2}/${targetFile}"

    rm -v "${target}"
}

for file in ${sourceDir}
do
  removeFile "${file}" "${HOME}"
done

echo "Finished :)"

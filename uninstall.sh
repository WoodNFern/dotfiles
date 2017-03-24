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
function unlinkFile {
    targetFile="${1/src\//}"
    targetFile="${targetFile/_/.}"
    target="${2}/${targetFile}"

    rm -v "${target}"
	
	# Only restore backup if target is a backup file
    if [ -f "${target}.bak" ]; then
        if [ ! -L "${target}.bak" ]; then
            echo "Restoring backing up ${target}.bak"
            mv -v "${target}.bak" "${target}"
        fi
    fi
}

for file in ${sourceDir}
do
  unlinkFile "${file}" "${HOME}"
done

echo "Finished :)"

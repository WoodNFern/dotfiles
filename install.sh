#!/usr/bin/env bash

##
## Intsalls the dotfiles into $HOME by softlinking them.
## Existing files are backupped.
##

sourceDir="src/_*"

##
## Links source file into target directory.
## Makes backup if target link already exists.
##
## @param $1 source script
## @param $2 target direcotry
##
function linkFile {
    source="${PWD}/$1"
    targetFile="${1/src\//}"
    targetFile="${targetFile/_/.}"
    target="${2}/${targetFile}"

    # Only create backup if target is a file or directory
    if [ -f "${target}" ] || [ -d "${target}" ]; then
        if [ ! -L "${target}" ]; then
            echo "Backing up ${target}"
            mv -v "${target}" "${target}.bak"
        fi
    fi

    ln -svf "${source}" "${target}"
}

for file in ${sourceDir}
do
  linkFile "${file}" "${HOME}"
done

## Add personal Git credentials to .gitconfig
gitconf="${HOME}/.gitconfig"
echo	
echo "Please enter your username for Git:"
read GIT_USER
sed -i "s/<GIT_USERNAME>/${GIT_USER}/g" ${gitconf}
echo	
echo "Please enter your email for Git:"
read GIT_EMAIL
sed -i "s/<GIT_EMAIL>/${GIT_EMAIL}/g" ${gitconf}
echo
echo "Finished :)"

# Dotfiles

## Instructions
### Creating source files

Any file which matches the shell glob `_*` will be linked as symlink/copied into `$HOME` 
with the first `_`  replaced with a `.`

For example:

    _bashrc

becomes

    ${HOME}/.bashrc

### Installing source files as symlink
It's as simple as running:

    ./install.sh

From this top-level directory.

### Installing source files by copying
If you cannot use symlinks e.g. if you are using cygwin on Windows, then you can run:

    ./copy-install.sh

### Uninstalling source files
When installing, all your files will be backed up as *.bak files. Using the uninstall
script the imported source files will be removed and your backed up files will be 
restored. Just run:

    ./uninstall.sh

This works for the .config directory, too. Just create a directory named '_config' 
and add files or directories in this directory. Everything inside _config will be 
symlinked to .config.

Thanks to [sontek](https://github.com/sontek), [Weltraumschaf](https://github.com/Weltraumschaf) 
and [saz](https://github.com/saz) for building the basis of this project!
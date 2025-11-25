# Bash Settings

My current bash settings.

This folder contains files of the type `bash<SOMETHING>`.
To be able to use these files, create symlinks in `~` to these files with the same name but pre-pended with a `.`.
For example, create a symlink called `~/.bashrc` to `bashrc` in this folder.

For the aliases to work, the following repositories must be present on the system:

- Under `~/tools/evologics-tools`: https://gitlab.evologics.de/michael.purser/evologics-tools
- Under `~/dev/dune`: https://gitlab.evologics.de/robotics/dune
- Under `~/.bash/git-aware-prompt`: https://github.com/jimeh/git-aware-prompt

For FZF to work properly, the package `fd-find` must be installed.
A link must be created from `fd` to `fdfind`, e.g., by running:
```bash
sudo ln -s $(which fdfind) /usr/local/bin/fd
```

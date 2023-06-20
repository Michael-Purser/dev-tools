# (Neo)Vim Config

My personal (constantly evolving) configuration for [Vim](https://www.vim.org/) and [Neovim](https://neovim.io/).


## Setup

1. Backup any previous vim/neovim configurations you might have.
1. Clone this repository.
1. Follow the instructions in the [Vim Setup](#vim-setup) and/or [Neovim Setup](#neovim-setup) sections below.
1. Open Vim or Neovim and run `:PlugInstall` to install the plugins.
1. Follow the instructions in the [Plugin Setup](#plugin-setup) section below. 
1. Restart vim or neovim.


## Vim Setup

For all plugins in this configuration to work properly, the following is required:

- Python with version 3.6 or greater.
- Vim with version 8.1 or greater that supports Python 3.6 is required.
  A possibility is to use [vim-gtk](https://packages.debian.org/stretch/vim-gtk).

Install & set vim-gtk as default for vim:
```
$ sudo apt install python3 vim-gtk
$ sudo update-alternatives --set vim usr/bin/vim.gtk3
```

Create a symlink called `~/.vimrc` that points to the `vimrc` file in this repository:
```
$ ln -s <REPOSITORY_LOCATION>/vimrc ~/.vimrc
```


## Neovim Setup

For all plugins in this configuration to work properly, the following is required:

- Neovim with version 0.9 or greater.

Unfortunately, Debian repositories contain rather old Neovim versions.
A possibility is to install neovim from source.

Follow the instructions here: https://github.com/neovim/neovim/wiki/Building-Neovim

Once neovim is built, create a folder `~/.config/nvim/` and create a symlink that points to the `vimrc` file in this repository:
```
$ mkdir -p ~/.config/nvim/
$ ln -s <REPOSITORY_LOCATION>/vimrc ~/.config/nvim/init.vim
```


## Plugin Setup


### YouCompleteMe (Vim Only)

This plugin needs to be installed and built separately.

For installation and setup: https://github.com/ycm-core/YouCompleteMe

> :information_source:<br>
> If you build with semantic support for C-family languages using `clangd`, you should also provide a link to the `compile_commands.json` file in your project source tree.<br>
> One suggestion is to use a symbolic link to the file in your build folder.<br>
> For more information, see: https://clangd.llvm.org/design/compile-commands.


### CoC (Neovim Only)

This plugin requires nodeJS with version 14.14 pr greater to be installed.
To install, execute as root (source: https://github.com/nodesource/distributions/blob/master/README.md):
```
$ curl -fsSL https://deb.nodesource.com/setup_19.x | bash
$ sudo apt install -y nodejs
```

> :information_source:<br>
> For `clangd`, it is recommended to use a version >= 15.06.<br>
> You can get a .zip archive of the version at https://github.com/clangd/clangd/releases.<br>
> Once it is downloaded, place the clangd executable in `/usr/local/bin/` and the include directory `clang/` in `/usr/local/lib/`.

In neovim, install the necessary CoC plugins by running:
```
:CocInstall coc-json coc-clangd
```

Finally, create a symlink to the CoC configuration file in this repository:
```
$ ln -s <REPOSITORY_LOCATION>/coc-settings.json ~/.config/nvim/coc-settings.json
```


### Autoformat

The Autoformat plugin will only work if there is a formatter installed on the system.

> :information_source:<br>
> For `clang-format`:<br>
> - In case it does not exist yet: create a symlink in `/usr/bin/` called `clang-format` that points to the formatter (e.g. `clang-format -> clang-format-14`)
> - Add a `.clang-format` file to your project root directory describing the formatting rules you wish to use (more info: https://clang.llvm.org/docs/ClangFormatStyleOptions.html)


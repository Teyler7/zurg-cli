# zurg-cli

![](/images/zurg.gif)

**zurg-cli** is a simple, easy to use custom shell built from [Oh-My-ZSH](https://ohmyz.sh) and [Starship](https://starship.rs/). It configures a pleasant, powerful, extendable, and simple to use shell.


## Installation

Please refer to [INSTALL.MD](https://github.com/Teyler7/zurg-cli/blob/main/INSTALL.md).

## Features / Configurations

- [Homebrew](https://brew.sh/)
- [nvm (Node Version Manager)](https://github.com/nvm-sh/nvm)
- [rbenv](https://github.com/rbenv/rbenv)
- [fzf (Fuzzy Finder)](https://github.com/junegunn/fzf)
  - Default configured to `ctrl` + `r`
- [Starship](https://starship.rs/)
- [ZSH Auto-Complete](https://github.com/marlonrichert/zsh-autocomplete)
- [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Oh-My-ZSH Git Shortcuts](https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index)
- [HTOP](https://htop.dev/)
- [Neovim](https://neovim.io/)
- [LunarVim](https://www.lunarvim.org/)

## Extending Zurg

If you want to add any additional things to the terminal, the best place to do that is the `custom.sh` file. The contents will be gitignored and they are appended to Zurg last.

## Uninstall

Run `sh uninstall.sh` to clean up the brew packages and revert back to the default configured shell environment that came before zurg-cli.

- Note: This will leave the packages from [packages.txt](https://github.com/teyler7/zurg-cli/blob/main/packages.txt) installed to prevent brew collisions.

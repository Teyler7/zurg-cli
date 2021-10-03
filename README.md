# zurg-cli

![](/images/zurg.gif)

**Zurg-cli** is a custom layer on top of Oh My Zsh[Oh My ZSH](https://ohmyz.sh). It helps configure settings that have been pleasant, powerful, extendable, and simple to use over the years.

## Main Features

#### Auto Completion

![](/images/auto-complete.gif)

#### syntax-highlighting

![](/images/syntax-highlighting.gif)

### Third Party Integrated Tools

#### Fuzzy Finder (fzf)

##### - Fuzzy Find Directory

`fdr`

![](/images/fuzzy-find.gif)

##### - Fuzzy Switch Branch

`fbr`

![](/images/fuzzy-branch.gif)

#### - Fuzzy History

- History CTRL+R

![](/images/fuzzy-history.gif)

### CLI Tool Details
##### ZSH

ZSH is an extended version of the Bourne Shell with plenty of new features and support for plugins and themes. Since it’s based on the same shell as Bash, ZSH has many of the same features, and switching over is a very simple and straight forward.

##### Oh My ZSH

https://ohmyz.sh/

Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration. It comes bundled with thousands of helpful functions, helpers, plugins, and themes.

##### FZF (Fuzzy Finder)

https://github.com/junegunn/fzf#key-bindings-for-command-line

fzf is a general-purpose command-line fuzzy finder.

##### Micro

https://github.com/zyedidia/micro

The best terminal editor open source can buy.

`micro`

![](/images/micro.gif)

##### HTOP

https://hisham.hm/htop/

This is htop, an interactive process viewer for Unix systems.

`htop`

![](/images/htop.gif)


## Extending Zurg

If you want to add any additional things to the terminal, the best place to do that is the `custom.sh` file. The contents will be gitignored and they are appended to Zurg last.
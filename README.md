# Danny's dotfiles.

Managed with [Thoughtbot's rcm](http://thoughtbot.github.io/rcm/rcm.7.html).

To install

1. Clone this repo into `~/.dotfiles`
2. Install RCM and create the symlinks

```shell
lsrc -x README.md -x dannysmith.zsh-theme # Dry run, check everything is ok.
rcup -v
rcup -x README.md -x dannysmith.zsh-theme
```

3. Install [Oh My ZSH](http://ohmyz.sh/) into `~/.oh-my-zsh`. My fork of OMZ [lives here](https://github.com/dannysmith/oh-my-zsh).

Note: If you haven't used my fork of OMZ, you'll need to move the theme file `dannysmith.zsh-theme` (which is also in this repo)  into `~/.oh-my-zsh/themes`.

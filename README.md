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

3. Install [Oh My ZSH](http://ohmyz.sh/) into `~/.oh-my-zsh`.
4. Move `dannysmith.zsh-theme` into `~/.oh-my-zsh/themes`.

# Danny's dotfiles.

Managed with [Thoughtbot's rcm](http://thoughtbot.github.io/rcm/rcm.7.html).

## To install

1. Clone this repo into `~/.dotfiles`
2. Install RCM and create the symlinks

```shell
lsrc -x README.md # Dry run, check everything is ok.
rcup -v
rcup -x README.md
```

3. Install [Oh My ZSH](http://ohmyz.sh/) into `~/.oh-my-zsh`.

## Additional Manual config steps

### Claude Code

Add the following MCPs to the end of `.claude.json` to make them globally available. This is nececarry as claude regularly updates this file (so it cannot live in this repo)

```json
"mcpServers": {
    "context7": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp"
      ],
      "env": {}
    },
    "playwright": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@playwright/mcp"
      ],
      "env": {}
    }
  }
```

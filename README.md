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

Clone down the [agents](https://github.com/dannysmith/agents) repo into `~/.claude/agents`

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

## Cursor/VSCode Settings

```json
{
  "editor.formatOnSave": true,
  "editor.formatOnPaste": true,
  "editor.fontFamily": "'Operator Mono Lig', 'Operator Mono', Monaco, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 15,
  "editor.fontWeight": "200",
  "editor.renderWhitespace": "all",
  "editor.tabSize": 2,
  "editor.inlineSuggest.enabled": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.minimap.autohide": true,
  "editor.minimap.scale": 2,
  "editor.minimap.renderCharacters": false,
  "editor.cursorBlinking": "expand",
  "editor.cursorSmoothCaretAnimation": "on",
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.accessibilitySupport": "off",
  "editor.bracketPairColorization.independentColorPoolPerBracketType": true,
  "editor.quickSuggestions": {
    "strings": "on"
  },
  "explorer.confirmDragAndDrop": false,
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "files.trimFinalNewlines": true,
  "terminal.external.osxExec": "Ghostty.app",
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.lineHeight": 1.2,
  "window.zoomLevel": 1,
  "workbench.colorTheme": "Cobalt Next",
  "workbench.startupEditor": "none",
  "extensions.ignoreRecommendations": true,
  "eslint.run": "onSave",
  "prettier.semi": false,
  "prettier.singleQuote": true,
  "githubPullRequests.pullBranch": "never",
  "git.enableSmartCommit": true,
  "git.autofetch": true,
  "typescript.updateImportsOnFileMove.enabled": "always",
  "cursor.cpp.disabledLanguages": ["plaintext", "markdown", "scminput"],
  "tailwindCSS.emmetCompletions": true,
  "tailwindCSS.experimental.classRegex": [
    ["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"],
    ["cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)"]
  ],
  "emmet.includeLanguages": {
    "astro": "html"
  },
  "emmet.showExpandedAbbreviation": "inMarkupAndStylesheetFilesOnly",
  "markdown.validate.enabled": false,
  "editor.tokenColorCustomizations": {
    "textMateRules": [
      {
        "scope": "heading.1.markdown entity.name.section.markdown, heading.1.markdown punctuation.definition.heading.markdown",
        "settings": {
          "foreground": "#9cecfb",
          "fontStyle": "bold"
        }
      },
      {
        "scope": "heading.2.markdown entity.name.section.markdown, heading.2.markdown punctuation.definition.heading.markdown",
        "settings": {
          "foreground": "#e255a1",
          "fontStyle": "bold"
        }
      }
    ]
  },
  "[markdown]": {
    "files.trimTrailingWhitespace": false,
    "editor.wordWrap": "wordWrapColumn",
    "editor.wordWrapColumn": 100
  },
  "[yaml]": {
    "files.trimTrailingWhitespace": false
  },
  "[astro]": {
    "editor.defaultFormatter": "astro-build.astro-vscode"
  }
}
```

### Cusror Keybindings

```json
[
  {
    "key": "cmd+i",
    "command": "composerMode.agent"
  },
  {
    "key": "shift+enter",
    "command": "workbench.action.terminal.sendSequence",
    "args": {
      "text": "\\\r\n"
    },
    "when": "terminalFocus"
  },
  {
    "key": "cmd+b",
    "command": "markdown.extension.editing.toggleBold",
    "when": "editorTextFocus && editorLangId == markdown"
  },
  {
    "key": "cmd+i",
    "command": "markdown.extension.editing.toggleItalic",
    "when": "editorTextFocus && editorLangId == markdown"
  },
  {
    "key": "cmd+e",
    "command": "composerMode.background"
  }
]
```

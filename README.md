# Danny's dotfiles.

Managed with [Thoughtbot's rcm](http://thoughtbot.github.io/rcm/rcm.7.html).

## To install

1. Clone this repo into `~/.dotfiles`
2. Install RCM and create the symlinks

```shell
lsrc -x README.md -x vscode-setup.md # Dry run, check everything is ok.
rcup -v
rcup -x README.md -x vscode-setup.md
```

3. Install [Oh My ZSH](http://ohmyz.sh/) into `~/.oh-my-zsh`.

## Additional Manual Config

### Ghostty Config

Install [Ghostty](https://ghostty.org/) and add the following config:

```
font-family = "Operator Mono"
font-size = 18
window-padding-x = 10
window-padding-y = 10
window-padding-color = background
window-padding-balance = true
theme = "iTerm2 Pastel Dark Background"
adjust-cell-height = 15%
window-save-state = always
background-opacity = 0.99
macos-titlebar-style = tabs
```

## VSCode Setup

My VSCode/Cursor setup is detailed in [vscode-setup.md](./vscode-setup.md). My actual `settings.json` and `keybindings.json` obviously change somewhat often but will always look something like this:

### `settings.json`

```json
{
  "editor.formatOnSave": false,
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
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "files.trimFinalNewlines": true,
  "explorer.confirmDragAndDrop": false,
  "terminal.external.osxExec": "Ghostty.app",
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.lineHeight": 1.2,
  "window.zoomLevel": 1,
  "workbench.colorTheme": "Cobalt Next",
  "workbench.startupEditor": "none",
  "workbench.activityBar.location": "top",
  "extensions.ignoreRecommendations": true,
  "eslint.run": "onSave",
  "prettier.proseWrap": "preserve",
  "prettier.semi": false,
  "prettier.singleQuote": true,
  "git.enableSmartCommit": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "githubPullRequests.pullBranch": "never",
  "typescript.updateImportsOnFileMove.enabled": "always",
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
  "[markdown]": {
    "files.trimTrailingWhitespace": false,
    "editor.wordWrap": "wordWrapColumn",
    "editor.wordWrapColumn": 100,
    "editor.defaultFormatter": "yzhang.markdown-all-in-one"
  },
  "[yaml]": {
    "files.trimTrailingWhitespace": false
  },
  "[astro]": {
    "editor.defaultFormatter": "astro-build.astro-vscode"
  },
  "claudeCode.preferredLocation": "panel",
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": false,
    "scminput": false
  }
}
```

### `keybindings.json`

```json
[
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
    "key": "shift+enter",
    "command": "workbench.action.terminal.sendSequence",
    "args": {
      "text": "\\\r\n"
    },
    "when": "terminalFocus"
  }
]
```

# VS Code Setup

This document describes how my VS Code is configured. It is the source of truth for what should be installed and what the global settings should look like.

## Intro

The guiding principle is to keep VS Code as close to its defaults as possible. I add cosmetic tweaks for the things I look at constantly (font, theme, whitespace), I add formatting and linting integration for the languages I actually write, I add a fairly heavy markdown layer because I write a lot of markdown, and I add a deliberately small amount of AI tooling. Everything else is left at the defaults VS Code ships with.

The other principle is **minimal AI in the editor, maximal AI in the terminal**. Almost all my AI-assisted work happens outside of my text editor. The editor just needs lightweight inline tab completion and the ability to generate commit messages. I don't want chat panels, agent modes, or anything that takes over screen real estate.

I also use Atom-style keybindings as a baseline, because muscle memory.

## Visual Setup

### Font and theme

- **Font:** Operator Mono Lig (with fallback to Operator Mono, then Monaco) at 15px, weight 200, with ligatures enabled.
- **Theme:** Cobalt Next (`dline.cobaltnext`).
- **Terminal font size:** 15px, line height 1.2.
- **External terminal:** Ghostty (`terminal.external.osxExec: "Ghostty.app"`). Sets which app VS Code opens when invoking "Open in External Terminal".

### UI layout

- **Activity Bar location:** `top`. The activity bar (Explorer / Search / Source Control / etc icons) sits horizontally above the file tree, rather than vertically at the far edge of the window. Brings the icons closer to where my eyes actually are.
- **Window zoom level:** 1.
- **Startup editor:** none (no welcome page when opening VS Code).
- **Minimap:** auto-hide on, scale 2x, render characters off — I want the colour blocks but not the tiny letters.

### Editor visuals

- **Render whitespace:** all whitespace characters visible.
- **Cursor blinking:** expand.
- **Smooth caret animation:** on.
- **Bracket pair colorization:** on, with an independent colour pool per bracket type so `{}` doesn't share colours with `[]` or `()`.

## Code Editing, Formatting & Linting

### Editor behaviour

- **Tab size:** 2 spaces.
- **Insert final newline on save:** yes.
- **Trim trailing whitespace on save:** yes (except markdown and YAML — see those sections).
- **Trim final newlines on save:** yes.
- **Format on paste:** yes.
- **Format on save: deliberately OFF.** I toggle this on and off per-project depending on what I'm working on. The default state is off because some projects have idiosyncratic formatting I want to preserve.
- **Default formatter:** Prettier (`esbenp.prettier-vscode`).
- **Inline suggestions:** enabled (this is the underlying engine that Copilot uses to show ghost text).
- **Quick suggestions in strings:** enabled.
- **Multi-cursor modifier:** cmd/ctrl (so I can use alt-click for column selection).
- **Accessibility support:** off — this is a performance setting, not an ideological one. The screen reader integration adds latency I don't need.

### Prettier

Prettier defaults are overridden globally so that any project without its own `.prettierrc` formats the way I want:

- Single quotes
- No semicolons
- Prose wrap: preserve (don't reflow paragraphs)

### ESLint

- Run on save (not as you type).

### TypeScript

- Update imports automatically when files are moved or renamed.

### Emmet

- Restrict Emmet auto-expansion to markup and stylesheet files only (`emmet.showExpandedAbbreviation: "inMarkupAndStylesheetFilesOnly"`). Without this, Emmet abbreviations try to expand in contexts where I don't want them.

### Extensions

- `esbenp.prettier-vscode` — Prettier integration.
- `dbaeumer.vscode-eslint` — ESLint integration.
- `christian-kohler.path-intellisense` — autocomplete for file paths in imports and string literals.

## Markdown Setup

This is the most heavily customised part of my config because I write a lot of markdown — notes, blog posts, docs, planning documents — and the default tooling does things to markdown files that I actively dislike. Prettier is too aggressive with markdown. It reflows paragraphs, fights with my line break conventions, and reformats lists in ways I don't want. So markdown files use a different default formatter:

- **Default formatter for `.md` files:** `yzhang.markdown-all-in-one` (not Prettier). markdown-all-in-one is more conservative — it respects my document structure and only does the things I actually want, like fixing list numbering and table alignment.

### Other markdown settings

- **Validation:** disabled. I don't want VS Code complaining about my links.
- **Word wrap:** wrap at column 100.
- **Trim trailing whitespace:** disabled for markdown specifically. This preserves the trailing-double-space line break syntax.
- **Heading colours:** H1 in cyan (`#9cecfb`) bold, H2 in magenta (`#e255a1`) bold. These are token colour customisations applied via `editor.tokenColorCustomizations`.
- **Prose wrap (Prettier):** preserve. Even though Prettier doesn't format my `.md` files directly, this setting affects markdown blocks embedded in other files.

### Extensions

- `yzhang.markdown-all-in-one` — Provides formatting, TOC generation, list continuation, keyboard shortcuts, table editing, and is the default formatter for `.md`.
- `jebbs.markdown-extended` — extends the built-in markdown preview with nicer rendering and additional features.
- `takumii.markdowntable` — markdown table editing helpers.
- `unifiedjs.vscode-mdx` — MDX (Markdown with JSX) syntax support.

### Keybindings

- `cmd+b` — toggle bold (active only when an `.md` file is focused).
- `cmd+i` — toggle italic (active only when an `.md` file is focused).

## Git Setup

### Settings

- **Smart commit:** enabled. Lets me commit when nothing is staged (commits everything modified) without first running `git add`.
- **Auto-fetch:** enabled.
- **Confirm sync:** disabled. Don't show me a dialog every time I sync.
- **GitHub PR pull branch:** never. When checking out a PR via the GH extension, don't automatically pull the latest from its branch.

### Extensions

- `github.vscode-pull-request-github` — review and manage GitHub PRs from inside the editor.
- `pomber.git-file-history` — show git history for an individual file.

Note: most of my git work happens in the terminal with `git` and `gh`. These extensions are for the cases where in-editor review or per-file history is genuinely faster.

## Keybindings Setup

The base layer is **Atom keybindings** via `ms-vscode.atom-keybindings`. This gives me Atom/Sublime-style shortcuts and matches years of muscle memory.

On top of that, three custom keybindings:

| Key           | Command                       | When                                          |
| ------------- | ----------------------------- | --------------------------------------------- |
| `cmd+b`       | Toggle markdown bold          | `editorTextFocus && editorLangId == markdown` |
| `cmd+i`       | Toggle markdown italic        | `editorTextFocus && editorLangId == markdown` |
| `shift+enter` | Send `\<newline>` to terminal | `terminalFocus`                               |

The `shift+enter` binding is what lets me write multi-line shell commands in the integrated terminal — it sends a backslash-continuation and a newline.

## AI Setup

Three extensions, configured for minimal-but-useful AI assistance.

### Extensions

- **`anthropic.claude-code`** — the official Claude Code IDE extension. It connects VS Code to a Claude Code session running in the terminal so Claude can see my open files, current selection, and so on. Configured to open in the bottom panel (`claudeCode.preferredLocation: "panel"`) so it sits beneath the editor like a terminal does, rather than hijacking the side bar.
- **`github.copilot`** — inline tab completion only. I use this for the ghost-text suggestions as I type. This is the one piece of "in-editor AI" I actively rely on.
- **`github.copilot-chat`** — installed only for the "Generate commit message" sparkle button in the Source Control view. I do not use the chat panel and don't intend to. The button is a feature of this extension and there's no way to get it without installing the whole thing.

### Per-language Copilot disable

I don't want Copilot trying to autocomplete prose. It's disabled in plaintext, markdown, and the source control commit input:

```json
"github.copilot.enable": {
  "*": true,
  "plaintext": false,
  "markdown": false,
  "scminput": false
}
```

### MCP Servers

VS Code's MCP config lives at `~/Library/Application Support/Code/User/mcp.json`. The only server configured is Context7, for up-to-date library documentation lookups:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

## Language-specific Setup

Extensions and small per-language settings for languages and tools I work with regularly. Each is here because I actively use the language, not because the extension is "nice to have".

- **Astro** — `astro-build.astro-vscode`. Provides templates, syntax, language server. Set as the default formatter for `.astro` files (`[astro]` block in settings). Also added to the Emmet language list (`emmet.includeLanguages.astro = "html"`) so Astro files get HTML Emmet completions.
- **Tailwind CSS** — `bradlc.vscode-tailwindcss`. Class autocomplete, hover previews. Configured with `tailwindCSS.emmetCompletions: true` and a custom `experimental.classRegex` so class strings inside `cva(...)` and `cx(...)` helpers also get autocompleted.
- **Bun** — `oven.bun-vscode`. Bun runtime support and debugger integration.
- **Rust** — `rust-lang.rust-analyzer`. Rust language server.
- **Tauri** — `tauri-apps.tauri-vscode`. Tauri framework support (commands, schema validation for `tauri.conf.json`).
- **TOML** — `tamasfe.even-better-toml`. Syntax highlighting and validation for TOML files.
- **Vitest** — `vitest.explorer`. Test runner UI for Vitest.
- **`.env` files** — `mikestead.dotenv`. Syntax highlighting for environment files.
- **CSS variables** — `vunguyentuan.vscode-css-variables`. Autocomplete and go-to-definition for CSS custom properties.
- **Brewfile** — `sharat.vscode-brewfile`. Syntax for Homebrew Brewfiles.

(MDX is also language-specific but is listed under Markdown because it's part of the markdown editing setup.)

## Other Extensions

General-purpose tools that don't fit cleanly into the categories above but that I keep around:

- **`ms-vscode-remote.remote-ssh`** — Microsoft's official Remote SSH extension for working on remote machines.
- **`ms-vsliveshare.vsliveshare`** — Live Share, for collaborative editing sessions.
- **`janisdd.vscode-edit-csv`** — spreadsheet-style CSV editor for larger CSV files.
- **`mechatroner.rainbow-csv`** — column colourisation for CSV files viewed in the regular text editor.
- **`tomoki1207.pdf`** — PDF viewer inside VS Code.
- **`ibm.output-colorizer`** — colourises output and log panes.
- **`oderwat.indent-rainbow`** — colourises indent levels.
- **`tyriar.lorem-ipsum`** — lorem ipsum generator.

## Misc

### YAML

- Trim trailing whitespace: disabled for YAML files (some YAML tooling cares about trailing whitespace, and I don't want it accidentally stripped).

### Explorer

- Confirm drag and drop: disabled. I trust myself to drag files around without a confirmation dialog.

### Extension recommendations

- `extensions.ignoreRecommendations: true`. Don't show me workspace extension recommendation popups.

### File locations (reference)

- Settings: `~/Library/Application Support/Code/User/settings.json`
- Keybindings: `~/Library/Application Support/Code/User/keybindings.json`
- MCP servers: `~/Library/Application Support/Code/User/mcp.json`
- User snippets: `~/Library/Application Support/Code/User/snippets/`
- Extensions: `~/.vscode/extensions/`

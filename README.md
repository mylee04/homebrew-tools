# Homebrew Tools

Personal Homebrew tap for my command-line tools.

## Installation

```bash
brew tap mylee04/tools
```

## Available Formulas

### code-notify

Cross-platform desktop notifications for AI coding tools (Claude Code, Codex, Gemini CLI).

Latest release: `v1.6.6`

- Warns during `cnp on` when Claude project trust has not been accepted yet
- Keeps trust handling explicit instead of automatically changing `~/.claude.json`
- Adds the same project-trust warning flow to the Windows installer path

```bash
brew install code-notify
```

If you already installed it and want the latest release:

```bash
brew update
brew upgrade code-notify
code-notify version
```

For more information, see [code-notify repository](https://github.com/mylee04/code-notify).

## Adding to this tap

To add a new formula:
1. Create a new `.rb` file in the `Formula/` directory
2. Test locally: `brew install --build-from-source Formula/tool-name.rb`
3. Commit and push to this repository

## License

MIT License - See individual tools for their specific licenses.

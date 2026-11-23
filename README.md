# Linux-macOS-dotfiles

My terminal-centric setup — macOS (M1 Pro), Dracula-ish colors, everything in the command line.

## What's inside

| Tool | Config | Notes |
|---|---|---|
| **zsh** | `.zshrc`, `.zprofile` | autosuggestions, syntax highlighting, zoxide, fzf, lsd/bat aliases |
| **Starship** | `.config/starship.toml` | prompt |
| **Neovim** | `.config/nvim` | LazyVim + code runner |
| **kitty** | `.config/kitty` | terminal, several themes in `themes/` |
| **tmux** | `.config/tmux` | based on Omarchy's config, prefix `Ctrl+Space` |
| **fastfetch** | `.config/fastfetch` | runs on every new shell |
| **btop** | `.config/btop` | system monitor |
| **git** | `.gitconfig` | delta as pager, side-by-side diffs |
| **Karabiner** | `.config/karabiner` | keyboard remaps |
| **LinearMouse** | `.config/linearmouse` | mouse settings |
| **Homebrew** | `Brewfile` | all CLI tools, apps and VS Code extensions |

CLI essentials: `lsd` `bat` `fd` `fzf` `zoxide` `git-delta` `tealdeer` `gh` `btop`

## Install

```bash
git clone https://github.com/rejmi100/Linux-macOS-dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh          # symlink configs (existing files → *.backup)
./install.sh --brew   # + install everything from Brewfile
```

On Linux skip `--brew`, Karabiner and LinearMouse — the rest works the same.

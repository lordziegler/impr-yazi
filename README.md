# Yazi — Imperator configuration

> *"The mystery of life isn't a problem to solve, but a reality to experience."*
> — Paul Atreides

Yazi configuration for the **Imperator** ricing — a terminal file manager styled with the amber CRT palette of House Corrino. Ten thousand years of imperial records, filtered through sandstone and phosphor.

---
### Showcase

![Yazi Config](impr-yazi/screenshots/image1.png)

![Code Previsualization](impr-yazi/screenshots/image2.png)

![PDF Previsualization](impr-yazi/screenshots/image3.png)

---

## What this configures

| File | Purpose |
|------|---------|
| `theme.toml` | Full Imperator visual theme — amber, dark basalt, gold hierarchy |
| `yazi.toml` | File openers, MIME associations, layout ratios |
| `keymap.toml` | Custom keybindings (prepended; all defaults preserved) |
| `init.lua` | Plugin bootstrap — loaded on startup |
| `package.toml` | Plugin lockfile — exact revisions for reproducible install |

---

## Dependencies

### Required

| Tool | Purpose | Install |
|------|---------|---------|
| `yazi` | File manager | `pacman -S yazi` |
| `ya` | Plugin manager CLI (ships with Yazi 26.x) | included |
| `nvim` | Default text editor | `pacman -S neovim` |
| `xdg-utils` | Fallback opener | `pacman -S xdg-utils` |

```sh
# one-liner
sudo pacman -S yazi neovim xdg-utils
```

### Optional openers

| Tool | Purpose | Install |
|------|---------|---------|
| `libreoffice` | Office documents | `pacman -S libreoffice-fresh` |
| `mpv` | Video and audio | `pacman -S mpv` |
| `gwenview` | Images | `pacman -S gwenview` |
| `okular` | PDF and epub | `pacman -S okular` |
| `positron` | Quarto / RMarkdown files | see warning below |



### Plugins (restored via `ya pkg install`)

| Plugin | Source | Purpose |
|--------|--------|---------|
| `jump-to-char` | `yazi-rs/plugins` | Jump to file by first char |
| `smart-filter` | `yazi-rs/plugins` | Live filter in normal mode |
| `git` | `yazi-rs/plugins` | Git status icons in listing |
| `chmod` | `yazi-rs/plugins` | Interactive permission picker |

---

## Paths

| Context | Path |
|---------|------|
| Active config | `~/.config/yazi/` |
| This repo | `yazi/` |

---

## Installation

```sh
# 1. Back up existing config (optional)
mv ~/.config/yazi ~/.config/yazi.bak

# 2. Symlink or copy the config directory
ln -s "$PWD/yazi" ~/.config/yazi
# or: cp -r yazi ~/.config/yazi

# 3. Restore plugins from the lockfile
ya pkg install
```

Yazi reads `~/.config/yazi/` on startup. No further steps required.

---

## Keybindings added

All Yazi defaults are preserved. These keys are prepended:

| Key | Action |
|-----|--------|
| `f` | Jump to file by first character |
| `F` | Smart filter (live, stays in normal mode) |
| `=` | Interactive chmod picker |
| `O` `l` | Force open with LibreOffice |
| `O` `p` | Force open with Positron |
| `O` `n` | Force open with nvim |

---

## File associations

| File type | Opener |
|-----------|--------|
| `.qmd`, `.rmd`, `.Rmd` | Positron |
| `.doc`, `.docx`, `.xls`, `.xlsx`, `.ppt`, `.pptx`, `.odt`, `.ods`, `.odp`, `.odg` | LibreOffice |
| `text/*`, code MIME types | nvim |
| `image/*` | Gwenview |
| `video/*`, `audio/*` | mpv |
| `application/pdf`, `.epub` | Okular |
| Archives | xdg-open |

---

## Compatibility

- Tested on **Yazi 26.5.6** (Arch Linux).
- `package.toml` locks plugin revisions — run `ya pkg update` to upgrade.
- Theme uses [Nerd Fonts](https://www.nerdfonts.com/) powerline glyphs. Requires a patched font in the terminal.
- `syntect_theme = "/dev/null"` disables syntax highlighting in the preview panel (intentional — the amber palette provides sufficient contrast without it).

---

## Warnings

**Positron path is hardcoded.**
Positron is not available in standard package managers and is not in `$PATH` on most systems. The opener in `yazi.toml` uses the absolute path `/usr/share/positron/positron`. After installing Positron, update this line or create a wrapper:

```sh
sudo ln -s /path/to/positron /usr/local/bin/positron
# then change the opener to: run = 'positron "$@"'
```


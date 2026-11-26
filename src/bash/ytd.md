# `ytd` — yt-dlp with Live Firefox Cookies

A small wrapper around `yt-dlp` that downloads a single video using your live Firefox session cookies. Useful for age-restricted, members-only, or otherwise authenticated videos without exporting a `cookies.txt` file.

---

## Features

* **Firefox cookie injection**: Reads cookies straight from the Firefox profile (`--cookies-from-browser firefox`).
* **Single video only**: `--no-playlist` prevents accidentally downloading an entire playlist when the URL contains one.
* **Full `yt-dlp` passthrough**: Any extra arguments are forwarded to `yt-dlp`.

---

## Prerequisites

```bash
sudo pacman -S yt-dlp firefox
```

Firefox must be installed and have an active profile. Close Firefox if its cookie database is locked.

---

## Installation

Source the tool from your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/Projects/tools/tools/linux_tools/src/bash/ytd.sh' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage

```bash
# Download the best quality single video
ytd "https://example.com/video"

# Choose a format and output template
ytd "https://example.com/video" -f "bv*+ba/b" -o "%(title)s.%(ext)s"

# List available formats
ytd -F "https://example.com/video"
```

---

## How It Works

```bash
yt-dlp --cookies-from-browser firefox --no-playlist "$@"
```

`yt-dlp` decrypts and reads Firefox's cookie store directly, so the download inherits your browser login. Because `--no-playlist` is always set, URLs with a `list=` parameter download only the requested video.

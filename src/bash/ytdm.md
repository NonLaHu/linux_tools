# `ytdm` — yt-dlp Audio (MP3) Downloader

A wrapper around `yt-dlp` that extracts the audio track from a single video and saves it as MP3, using your live Firefox session cookies.

---

## Features

* **Audio-only download**: Extracts the best audio stream (`-x`) and converts it to MP3 (`--audio-format mp3`).
* **Firefox cookie injection**: Reads cookies straight from the Firefox profile (`--cookies-from-browser firefox`).
* **Single video only**: `--no-playlist` prevents downloading an entire playlist by accident.
* **Full `yt-dlp` passthrough**: Any extra arguments are forwarded to `yt-dlp`.

---

## Prerequisites

```bash
sudo pacman -S yt-dlp ffmpeg firefox
```

`ffmpeg` is required for audio extraction and MP3 conversion.

---

## Installation

Source the tool from your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/Projects/tools/tools/linux_tools/src/bash/ytdm.sh' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage

```bash
# Download the audio as MP3
ytdm "https://example.com/video"

# Pick the output directory and name
ytdm "https://example.com/video" -o "~/Music/%(title)s.%(ext)s"

# Embed metadata and thumbnail
ytdm "https://example.com/video" --embed-metadata --embed-thumbnail
```

---

## How It Works

```bash
yt-dlp --cookies-from-browser firefox --no-playlist -x --audio-format mp3 "$@"
```

`yt-dlp` downloads the best audio stream, `ffmpeg` converts it to MP3, and the temporary source file is removed automatically.

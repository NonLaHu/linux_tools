#!/usr/bin/env bash
#
# ytdm — download the audio track of a single video as MP3 using yt-dlp.
#
# Source this file from your shell configuration (~/.bashrc or ~/.zshrc):
#   source /path/to/linux_tools/src/bash/ytdm.sh
#
# Documentation: src/bash/ytdm.md

ytdm() {
    yt-dlp --cookies-from-browser firefox --no-playlist -x --audio-format mp3 "$@"
}

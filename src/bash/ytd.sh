#!/usr/bin/env bash
#
# ytd — download a single video with yt-dlp using live Firefox cookies.
#
# Source this file from your shell configuration (~/.bashrc or ~/.zshrc):
#   source /path/to/linux_tools/src/bash/ytd.sh
#
# Documentation: src/bash/ytd.md

ytd() {
    yt-dlp --cookies-from-browser firefox --no-playlist "$@"
}

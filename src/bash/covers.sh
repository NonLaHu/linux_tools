#!/usr/bin/env bash
#
# covers — jump to the audio_ai project or delegate to its covers CLI.
#
# Source this file from your shell configuration (~/.bashrc or ~/.zshrc):
#   source /path/to/linux_tools/src/bash/covers.sh
#
# Documentation: src/bash/covers.md

covers() {
    if [ "${1:-}" = "cd" ]; then
        cd "$HOME/Projects/tools/audio_ai" || return
    else
        command covers "$@"
    fi
}

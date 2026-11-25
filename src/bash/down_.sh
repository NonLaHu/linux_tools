#!/usr/bin/env bash
#
# down_ — fast multi-connection CLI downloader wrapper around aria2c.
#
# Source this file from your shell configuration (~/.bashrc or ~/.zshrc):
#   source /path/to/linux_tools/src/bash/down_.sh
#
# Documentation: src/bash/down_.md

down_() {
    if [ -z "$1" ]; then
        echo "Usage:"
        echo "  down_ <URL> [aria2c options]"
        echo "  down_ -f <URL> [aria2c options]        # Use Firefox cookies directly with aria2c"
        echo "  down_ -mpi <URL> -o <filename.zip>     # Login & download from download.is.tue.mpg.de"
        return 1
    fi

    if [ "$1" = "-mpi" ]; then
        shift
        local url="$1"
        shift
        read -rp "MPI Email: " mpi_user
        read -rsp "MPI Password: " mpi_pass
        echo ""
        local cookie_file
        cookie_file=$(mktemp)
        curl -s -c "$cookie_file" -d "username=${mpi_user}&password=${mpi_pass}" "$url" -o /dev/null
        aria2c --load-cookies="$cookie_file" -x 4 -s 4 --max-tries=0 --retry-wait=5 -c "$url" "$@"
        rm -f "$cookie_file"
    elif [ "$1" = "-f" ]; then
        shift
        local cookie_file
        cookie_file=$(mktemp)
        python3 -c "from yt_dlp.cookies import extract_cookies_from_browser; extract_cookies_from_browser('firefox').save('$cookie_file')"
        aria2c --load-cookies="$cookie_file" -x 16 -s 16 --max-tries=0 --retry-wait=5 -c "$@"
        rm -f "$cookie_file"
    else
        aria2c -x 16 -s 16 --max-tries=0 --retry-wait=5 -c "$@"
    fi
}

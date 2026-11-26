#!/usr/bin/env bash
#
# nopass — toggle passwordless sudo for the current user.
#
# Source this file from your shell configuration (~/.bashrc or ~/.zshrc):
#   source /path/to/linux_tools/src/bash/nopass.sh
#
# Documentation: src/bash/nopass.md

# Toggle passwordless sudo (on / off / toggle / status)
nopass() {
    local file="/etc/sudoers.d/$USER"
    case "${1:-status}" in
        on)
            local tmp
            tmp=$(mktemp) || return 1
            echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" > "$tmp"
            if sudo visudo -cf "$tmp" >/dev/null 2>&1; then
                sudo install -m 0440 -o root -g root "$tmp" "$file"
                rm -f "$tmp"
                echo "Passwordless sudo: ON"
            else
                rm -f "$tmp"
                echo "Error: sudoers syntax validation failed." >&2
                return 1
            fi
            ;;
        off)
            sudo rm -f "$file" && sudo -k
            echo "Passwordless sudo: OFF"
            ;;
        toggle)
            if sudo -n test -f "$file" 2>/dev/null; then
                nopass off
            else
                nopass on
            fi
            ;;
        status)
            if sudo -n test -f "$file" 2>/dev/null; then
                echo "Passwordless sudo: ON"
            else
                echo "Passwordless sudo: OFF"
            fi
            ;;
        *)
            echo "Usage: nopass [on|off|toggle|status]"
            return 1
            ;;
    esac
}

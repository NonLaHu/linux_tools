# `covers` — Audio AI Project Shortcut

A convenience function for the `audio_ai` project. With `cd` it jumps straight to the project directory; with any other arguments it delegates to the deployed `covers` CLI.

---

## Features

* **Quick project jump**: `covers cd` changes to `~/Projects/tools/audio_ai`.
* **Transparent delegation**: All other arguments are passed to the real `covers` command (`command covers` bypasses this function).
* **Works with `cover`**: The companion `cover` function is a shorthand for `covers`.

---

## Prerequisites

* The `audio_ai` project cloned at `~/Projects/tools/audio_ai` (for `covers cd`).
* A `covers` executable in `PATH`, usually a symlink to `audio_ai/covers.py`:

```bash
ln -s ~/Projects/tools/audio_ai/covers.py ~/.local/bin/covers
```

---

## Installation

Source the tool from your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/Projects/tools/tools/linux_tools/src/bash/covers.sh' >> ~/.bashrc
source ~/.bashrc
```

If you also want the `cover` shorthand, source `cover.sh` as well.

---

## Usage

```bash
covers cd                          # jump to the audio_ai project
covers --help                      # delegate to the covers CLI
covers "some song" --model miku    # delegate with arguments
```

---

## How It Works

```bash
covers() {
    if [ "${1:-}" = "cd" ]; then
        cd "$HOME/Projects/tools/audio_ai" || return
    else
        command covers "$@"
    fi
}
```

`command covers` skips the shell function and runs the executable found in `PATH`, avoiding infinite recursion.

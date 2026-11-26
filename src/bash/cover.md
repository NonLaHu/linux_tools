# `cover` — Shorthand for `covers`

A one-word shorthand for the [`covers`](covers.md) function.

---

## Features

* **Same behavior as `covers`**: `cover cd` jumps to the `audio_ai` project; other arguments go to the `covers` CLI.
* **Zero duplication**: Simply forwards all arguments to `covers`.

---

## Prerequisites

The [`covers`](covers.md) function must also be sourced, and the `covers` executable must be available in `PATH` for non-`cd` usage.

---

## Installation

Source the tool from your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/Projects/tools/tools/linux_tools/src/bash/cover.sh' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage

```bash
cover cd                        # jump to the audio_ai project
cover --help                    # delegate to the covers CLI
cover "some song" --model miku  # delegate with arguments
```

---

## How It Works

```bash
cover() {
    covers "$@"
}
```

All arguments are forwarded unchanged to the `covers` function.

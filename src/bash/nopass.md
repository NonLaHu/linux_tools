# `nopass` — Toggle Passwordless Sudo

A small helper for enabling, disabling, toggling, or checking passwordless `sudo` for the current user by managing `/etc/sudoers.d/$USER`.

---

## Features

* **Four actions**: `on`, `off`, `toggle`, and `status` (default).
* **Validated before install**: Writes the rule to a temporary file and checks it with `visudo -cf` before touching `/etc/sudoers.d/`.
* **Correct ownership and mode**: Installs the rule as `root:root` with mode `0440`.
* **Invalidates cached credentials**: `off` runs `sudo -k` so an existing sudo timestamp does not keep working.

---

## Prerequisites

* `sudo` and `visudo` installed.
* Permission to run `sudo` (you will be prompted for your password when enabling or disabling).

---

## Installation

Source the tool from your shell configuration (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/Projects/tools/tools/linux_tools/src/bash/nopass.sh' >> ~/.bashrc
source ~/.bashrc
```

---

## Usage

```bash
nopass status   # show current state (default)
nopass on       # enable passwordless sudo
nopass off      # disable passwordless sudo
nopass toggle   # flip the current state
```

---

## How It Works

`nopass on` writes this rule to a temporary file:

```text
$USER ALL=(ALL:ALL) NOPASSWD: ALL
```

The file is validated with `visudo -cf`, then installed as `/etc/sudoers.d/$USER` with owner `root:root` and mode `0440`. `nopass off` removes that file and clears cached sudo credentials.

> **Security note:** Passwordless sudo lets any process running as your user execute commands as root without confirmation. Enable it only on machines you control.

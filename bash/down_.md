# `down_` — Fast Multi-Connection CLI Downloader Wrapper

A lightweight Bash/Zsh wrapper around `aria2c` configured for maximum download speed, automatic resume, unlimited retries, live Firefox session cookie extraction, and authenticated Max Planck Institute (`is.tue.mpg.de`) dataset downloads.

---

## Features

* **High-Speed Multi-Connection Downloads**: Splits files into up to 16 parallel connections (`-x 16 -s 16`) to saturate available bandwidth.
* **Resilient & Unattended**: Automatically resumes partial downloads (`-c`) and retries indefinitely (`--max-tries=0`) with a 5-second cooldown (`--retry-wait=5`) on unstable connections.
* **Direct Firefox Cookie Injection (`-f`)**: Uses `yt-dlp`'s cookie extractor in Python to dump your live Firefox SQLite cookies into a temporary Netscape-format cookie jar for `aria2c`—no browser extensions needed.
* **MPI Dataset Authentication (`-mpi`)**: Authenticates via POST against `download.is.tue.mpg.de` (for SMPL, MANO, SMPL-X, etc.) and hands the session cookie to `aria2c` with safe connection limits (`-x 4 -s 4`).

---

## Prerequisites

Install the required dependencies on Arch Linux:

```bash
sudo pacman -S aria2 yt-dlp curl python
```

---

## Installation

1. Copy the script somewhere stable, for example:

```bash
mkdir -p ~/.local/share/linux_tools
cp bash/down_.sh ~/.local/share/linux_tools/down_.sh
```

2. Source it from your shell configuration file (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'source ~/.local/share/linux_tools/down_.sh' >> ~/.bashrc
```

3. Reload your shell configuration:

```bash
source ~/.bashrc   # or source ~/.zshrc
```

Alternatively, copy the `down_` function directly into your shell configuration file.

---

## Usage

### 1. Standard Fast Download

```bash
down_ "https://example.com/file.zip"
```

### 2. Custom Output Filename or Extra `aria2c` Flags

Any additional flags after the URL are forwarded directly to `aria2c`:

```bash
down_ "https://example.com/file.zip" -o custom_name.zip -d ~/Downloads
```

### 3. Download Using Active Firefox Session (`-f`)

Useful for files behind a browser login (e.g., Kaggle, Hugging Face, private portals):

```bash
down_ -f "https://example.com/private-file.zip"
```

### 4. Download Max Planck Institute Datasets (`-mpi`)

Prompts for your MPI credentials without echoing your password, authenticates, and downloads the archive:

```bash
down_ -mpi "https://download.is.tue.mpg.de/..." -o mano_v1_2.zip
```

---

## How It Works Under the Hood

1. **Temporary Cookie Jars (`mktemp`)**: Both `-f` and `-mpi` generate a secure temporary file in `/tmp`, pass it to `aria2c` via `--load-cookies`, and automatically delete it (`rm -f`) once the download finishes.
2. **Firefox SQLite Bridge**: Because `aria2c` only reads plain-text Netscape `cookies.txt` files while Firefox stores cookies in an encrypted/locked SQLite database, the `-f` mode invokes `yt_dlp.cookies.extract_cookies_from_browser` as a lightweight Python bridge.
3. **Server Rate-Limit Protection**: Standard downloads use 16 connections (`-x 16 -s 16`), whereas `-mpi` steps down to 4 connections (`-x 4 -s 4`) to prevent `download.is.tue.mpg.de` from dropping concurrent session requests.

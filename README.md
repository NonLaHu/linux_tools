# linux_tools

A personal collection of small, practical Linux command-line tools.

## Tools

| Tool | Description | Docs |
| --- | --- | --- |
| `down_` | Fast multi-connection `aria2c` downloader with Firefox cookie and MPI dataset support. | [Documentation](src/bash/down_.md) |
| `ytd` | Download a single video with `yt-dlp` using live Firefox cookies. | [Documentation](src/bash/ytd.md) |
| `ytdm` | Extract a video's audio track to MP3 with `yt-dlp`. | [Documentation](src/bash/ytdm.md) |
| `nopass` | Toggle passwordless `sudo` for the current user. | [Documentation](src/bash/nopass.md) |
| `covers` | Jump to the `audio_ai` project or delegate to its `covers` CLI. | [Documentation](src/bash/covers.md) |
| `cover` | Shorthand for `covers`. | [Documentation](src/bash/cover.md) |

## Git Repository Notes

Usage notes for my GitHub projects, stored as one Markdown file per repository:

| Repository | Docs |
| --- | --- |
| `audvis` | [audvis.md](src/git/audvis.md) |
| `photo-asker` | [photo-asker.md](src/git/photo-asker.md) |
| `deploy_tool` | [deploy_tool.md](src/git/deploy_tool.md) |
| `wifi_monitor` | [wifi_monitor.md](src/git/wifi_monitor.md) |
| `ctf_fetch` | [ctf_fetch.md](src/git/ctf_fetch.md) |
| `audio_ai` | [audio_ai.md](src/git/audio_ai.md) |
| `burmese-voice-ai` | [burmese-voice-ai.md](src/git/burmese-voice-ai.md) |
| `git_dirty` | [git_dirty.md](src/git/git_dirty.md) |

## Repository Layout

```text
linux_tools/
├── src/
│   ├── bash/
│   │   ├── down_.sh    # sourceable shell function
│   │   ├── down_.md    # documentation
│   │   ├── ytd.sh
│   │   ├── ytd.md
│   │   ├── ytdm.sh
│   │   ├── ytdm.md
│   │   ├── nopass.sh
│   │   ├── nopass.md
│   │   ├── covers.sh
│   │   ├── covers.md
│   │   ├── cover.sh
│   │   └── cover.md
│   └── git/
│       ├── audvis.md
│       ├── photo-asker.md
│       ├── deploy_tool.md
│       ├── wifi_monitor.md
│       ├── ctf_fetch.md
│       ├── audio_ai.md
│       ├── burmese-voice-ai.md
│       └── git_dirty.md
├── LICENSE
└── README.md
```

## Installation

Each tool is a self-contained shell function. Source the file you need from `~/.bashrc` (or `~/.zshrc`):

```bash
echo 'source /path/to/linux_tools/src/bash/down_.sh' >> ~/.bashrc
source ~/.bashrc
```

To load every bash tool at once, source the directory with a small loader:

```bash
_load_linux_tools() {
    local dir="${LINUX_TOOLS_DIR:-$HOME/Projects/tools/tools/linux_tools}/src/bash"
    local tool
    [ -d "$dir" ] || return 0
    for tool in "$dir"/*.sh; do
        [ -r "$tool" ] && . "$tool"
    done
}
_load_linux_tools
unset -f _load_linux_tools
```

This is the setup used in `~/.bashrc`: any new `<tool>.sh` dropped into `src/bash/` is loaded on the next shell start.

## Requirements

See the documentation of each tool for its full dependency list.

| Tool | Requirements |
| --- | --- |
| `down_` | `aria2`, `curl`, `python`, `yt-dlp` |
| `ytd` | `yt-dlp`, Firefox with an active profile |
| `ytdm` | `yt-dlp`, `ffmpeg`, Firefox with an active profile |
| `nopass` | `sudo` with `visudo` |
| `covers`, `cover` | `audio_ai` checkout and a `covers` executable in `PATH` |

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).

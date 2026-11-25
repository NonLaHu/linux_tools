# linux_tools

A personal collection of small, practical Linux command-line tools.

## Tools

| Tool | Description | Docs |
| --- | --- | --- |
| `down_` | Fast multi-connection `aria2c` downloader with Firefox cookie and MPI dataset support. | [Documentation](src/bash/down_.md) |

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
│   │   ├── down_.sh   # sourceable shell function
│   │   └── down_.md   # documentation
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

Each tool is self-contained. Copy the script to a stable location and source it from your shell configuration, or follow the installation section in the tool's documentation.

For example, to install `down_`:

```bash
mkdir -p ~/.local/share/linux_tools
cp src/bash/down_.sh ~/.local/share/linux_tools/down_.sh
echo 'source ~/.local/share/linux_tools/down_.sh' >> ~/.bashrc
source ~/.bashrc
```

## Requirements

See the documentation of each tool for its dependencies. `down_` requires `aria2`, `curl`, `python`, and `yt-dlp`.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).

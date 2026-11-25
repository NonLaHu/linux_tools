# linux_tools

A personal collection of small, practical Linux command-line tools.

## Tools

| Tool | Description | Docs |
| --- | --- | --- |
| `down_` | Fast multi-connection `aria2c` downloader with Firefox cookie and MPI dataset support. | [Documentation](bash/down_.md) |

## Repository Layout

```text
linux_tools/
├── bash/
│   ├── down_.sh   # sourceable shell function
│   └── down_.md   # documentation
├── LICENSE
└── README.md
```

## Installation

Each tool is self-contained. Copy the script to a stable location and source it from your shell configuration, or follow the installation section in the tool's documentation.

For example, to install `down_`:

```bash
mkdir -p ~/.local/share/linux_tools
cp bash/down_.sh ~/.local/share/linux_tools/down_.sh
echo 'source ~/.local/share/linux_tools/down_.sh' >> ~/.bashrc
source ~/.bashrc
```

## Requirements

See the documentation of each tool for its dependencies. `down_` requires `aria2`, `curl`, `python`, and `yt-dlp`.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).

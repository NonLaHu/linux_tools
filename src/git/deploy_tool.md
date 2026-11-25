# deploy_tool

**Repo:** https://github.com/NonLaHu/deploy_tool
**Visibility:** Public
**Stack:** Python
**License:** MIT

Deploy Python scripts, shell scripts, and compiled binaries into your `PATH` with one command. It detects the file type, adds a Python shebang when needed, makes the file executable, and symlinks it into `~/.local/bin`.

## Requirements

- Python 3.8+
- `~/.local/bin` in your `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Reload your shell after adding it.

## Clone and Install

```bash
git clone https://github.com/NonLaHu/deploy_tool.git
cd deploy_tool
```

Run directly without installing:

```bash
./main.py --help
```

Or install the `deploy-tool` command:

```bash
pip install -e .
```

## Use

```bash
deploy-tool <source_script> <command_name>
```

Examples:

```bash
# Python script (adds shebang if missing)
deploy-tool examples/hello_python.py hello-py

# Shell script
deploy-tool examples/hello_script.sh hello-sh

# Compiled binary
deploy-tool ./mybinary mybinary

# Preview only
deploy-tool examples/hello_python.py test-cmd --dry-run

# Custom target directory
deploy-tool myscript.py mytool -t /usr/local/bin
```

Options: `-t/--target-dir`, `-n/--dry-run`, `-v/--version`, `-h/--help`.

Deployment uses a symlink, so edits to the source file take effect immediately. Deploying a name that already exists replaces the old symlink.

## Self-Deploy

Make `deploy-tool` itself globally available:

```bash
./main.py main.py deploy-tool
```

## Tests

```bash
python3 -m unittest discover tests
```

## Upstream Documentation

See the repository [README](https://github.com/NonLaHu/deploy_tool#readme) for the full option reference.

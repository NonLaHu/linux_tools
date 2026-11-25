# audio_ai

**Repo:** https://github.com/NonLaHu/audio_ai
**Visibility:** Public
**Stack:** Python, PyTorch, Gradio, RVC, FastAPI
**License:** MIT

A customized [Applio](https://applio.org) build for voice conversion, plus additional meme/dialogue audio tools. Applio provides the RVC voice-conversion web UI; this repository adds JSON-driven dialogue generation, a browser studio, and one-command song covers.

## What's Included

- **Applio web UI** — voice conversion and model training (`run-applio.sh`).
- **Dialogue generator** — Edge-TTS synthesis, RVC character conversion, per-line filters, stitching, and BGM (`meme.py`).
- **Meme Audio Studio** — browser GUI for recording, uploading, converting, and arranging dialogue (`meme_studio.py`).
- **Song covers** — split, convert, and mix a full cover in one command (`make_cover.py`).

## Requirements

- Linux or macOS (Windows uses the `.bat` scripts)
- Python 3.12, installed through `uv`
- FFmpeg and basic build tools
- NVIDIA GPU recommended; the installer uses the CUDA 12.8 PyTorch index on Linux
- Several GB of disk space for dependencies and models

`run-install.sh` installs `uv`, FFmpeg, Python 3.12, and all dependencies into `.venv`.

## Install

```bash
git clone https://github.com/NonLaHu/audio_ai.git
cd audio_ai
./run-install.sh
```

## Run Applio

```bash
./run-applio.sh
```

This launches the Gradio interface in your browser.

## Dialogue / Meme Tools

Create and inspect projects:

```bash
./meme --example                  # print an annotated example project
./meme --init my_project.json     # generate a starter JSON file
./meme my_project.json            # render the dialogue
./meme --list-models              # available RVC character models
./meme --list-voices              # available Edge-TTS voices
```

Start the browser studio:

```bash
./meme-studio.sh
# or
./meme-studio.sh --port 5050 --host 0.0.0.0
```

Place RVC models under `logs/` so they appear in the model list. The tools expect models such as the bundled character aliases (`miku`, `teto`, `fubuki`, `pekora`, `corpse`) or a path to another model.

## Song Covers

```bash
./make-cover.sh <song_file> <model_name> [pitch_shift]
./make-cover.sh --list-models
```

Example:

```bash
./make-cover.sh ~/Music/song.mp3 miku +12
```

Additional options include `--quality standard|compact|128k`, `--clean-stems`, and `--clean-all-stems`.

## Notes

- The first install downloads large PyTorch and model files.
- Upstream Applio terms apply; see `TERMS_OF_USE.md`.
- Applio documentation: <https://docs.applio.org>

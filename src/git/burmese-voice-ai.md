# burmese-voice-ai

**Repo:** https://github.com/NonLaHu/burmese-voice-ai
**Visibility:** Public
**Stack:** Python, PyTorch, Transformers, ONNX Runtime, FFmpeg

A local Voice AI toolkit for Burmese and English: speech-to-text, text-to-speech, and microphone recording with optional dictation. It is tuned for consumer GPUs (including a 4 GB RTX 2050) with 8-bit quantization and FP16, and also supports CPU inference.

## Engines

- English STT: `openai/whisper-large-v3-turbo`
- Burmese STT: `BuzzASR/burmese` (8-bit)
- Burmese/English TTS: `YeeNyunn/nara-mini-v1` (Kokoro ONNX)
- Recording: PipeWire/PulseAudio + FFmpeg LAME

## Requirements

- Linux
- Python 3.12
- `ffmpeg`
- `uv` recommended (the setup script falls back to `venv`/`pip`)
- Optional NVIDIA GPU + CUDA; CPU works but is slower
- Disk space and internet access for model downloads

Arch Linux:

```bash
sudo pacman -S ffmpeg
```

## Install

```bash
git clone https://github.com/NonLaHu/burmese-voice-ai.git
cd burmese-voice-ai
./setup.sh
```

`setup.sh` creates `.venv`, installs dependencies, makes the CLI scripts executable, symlinks `voice`, `speech`, `record-mp3`, `buzzasr`, and `nara-tts` into `~/.local/bin`, and downloads the model weights.

Ensure `~/.local/bin` is in your `PATH`.

## Use

Show hardware and model status:

```bash
voice status
```

Speech-to-text:

```bash
voice stt lecture.mp3 -l en
voice stt burmese.wav -l my
voice stt memo.m4a -l auto -o transcript.txt
voice stt audio.wav --device cpu
```

Text-to-speech:

```bash
voice tts "Welcome to the toolkit." -o welcome.mp3
voice tts "မင်္ဂလာပါ။" -o burmese.mp3
voice tts "Hello world" -v ko-banyar --play
```

Voices: `shoon` (default), `thazin`, `ko-banyar`, `htet-myat`.

Recording:

```bash
record-mp3 memo.mp3
record-mp3 -d 15 quick_note.mp3
voice record dictation.mp3 --transcribe -l en
```

## Notes

- The first run downloads several models and can take a while.
- The README's `cd ai` instruction is outdated; use the repository directory name after cloning.
- Model licenses: BuzzASR and Whisper MIT, Nara Mini / Kokoro Apache 2.0.

# audvis

**Repo:** https://github.com/NonLaHu/audvis
**Visibility:** Public
**Stack:** Vanilla JavaScript, Web Audio API, Canvas 2D, MediaRecorder
**License:** MIT

A local-first browser audio visualizer and soundwave video generator. Load an audio file, use the built-in 118 BPM demo synth, or visualize a live microphone, then export WebM (with alpha transparency) or MP4 without uploading anything.

## Requirements

- A modern Chromium, Firefox, or Safari browser.
- No backend, build step, or package installation.
- Python 3 only if you want to serve the files over HTTP (recommended for microphone access).

## Clone

```bash
git clone https://github.com/NonLaHu/audvis.git
cd audvis
```

## Run

Open `index.html` directly in a browser, or serve the directory:

```bash
python3 -m http.server 8000
```

Then visit <http://localhost:8000>.

## Use

1. Choose an audio source: drag in a local file, start the demo synth, or enable the microphone.
2. Pick one of the 18 visualizer engines and tune sensitivity, smoothing, FFT detail, colors, glow, background, and aspect ratio.
3. Press play and inspect the preview.
4. Export as WebM (supports transparent backgrounds) or MP4 where the browser supports it, at 30 or 60 fps and up to 3x resolution.

Keyboard shortcuts: `Space` play/pause, `S` stop, `←`/`→` seek 5 seconds, `M` mute.

## Notes

- Microphone capture requires `localhost` or HTTPS.
- Everything runs client-side; no file leaves the machine.
- WebM export is the most reliable transparent-video option.

## Upstream Documentation

See the repository [README](https://github.com/NonLaHu/audvis#readme) for the full feature list and project structure.

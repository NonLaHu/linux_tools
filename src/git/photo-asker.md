# photo-asker

**Repo:** https://github.com/NonLaHu/photo-asker
**Visibility:** Public
**Stack:** Python, OpenCV, pynput, Firefox automation
**License:** MIT

Camera-to-Gemini desktop automation for Linux. It opens a camera preview, captures a photo on `Enter`, copies it to the clipboard, opens Gemini in Firefox, pastes the image, and submits an optional question.

Designed and tested on the **Niri** Wayland compositor.

## Requirements

- Python 3.10+
- `uv` (recommended) or `opencv-python`, `numpy`, `pynput`
- `wl-clipboard` on Wayland or `xclip` on X11
- `wtype` on Wayland or `ydotool` on X11
- Firefox
- Niri for reliable page-load detection (other compositors fall back to fixed delays)

Arch example:

```bash
sudo pacman -S firefox wl-clipboard wtype uv
```

## Install

```bash
git clone https://github.com/NonLaHu/photo-asker.git
cd photo-asker
./install.sh
```

The installer symlinks `photo-asker` into `~/.local/bin`; make sure that directory is in your `PATH`.

## Use

```bash
photo-asker
```

Preview controls:

| Key | Action |
| --- | --- |
| `Enter` | Capture, flip if enabled, copy, and send to Gemini |
| `Tab` | Toggle horizontal flip of the sent photo |
| `Esc` / `q` | Cancel and exit |
| Type text | Add an optional question |

Daemon/hotkey mode:

```bash
photo-asker --listen --hotkey '<ctrl>+<alt>+p'
```

Useful flags:

```bash
photo-asker --camera 1                 # select camera device
photo-asker --prompt "What is this?"   # default question
photo-asker --no-flip                  # do not flip before sending
photo-asker --page-delay 4 --upload-delay 5
```

## Notes

- On Niri, the script polls `niri msg -j windows` for the Gemini page; other compositors use fixed timers and may need larger delays.
- If Firefox is already running, focus behavior may be unreliable.
- `ydotool` usually needs the `uinput` kernel module and appropriate permissions.

## Upstream Documentation

See the repository [README](https://github.com/NonLaHu/photo-asker#readme) for the compositor support matrix and full flag list.

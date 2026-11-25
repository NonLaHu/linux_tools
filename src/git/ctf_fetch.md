# ctf_fetch

**Repo:** https://github.com/NonLaHu/ctf_fetch
**Visibility:** Public
**Stack:** Python, Selenium, BeautifulSoup, Tabulate

Scrapes CTFtime for upcoming online CTF events in the next 7 days, then visits each event page to extract the official website and prize information. Results are printed as a table with dates and durations in Myanmar Time (MMT, UTC+6:30).

## Requirements

- Python 3.10+
- Firefox and `geckodriver`
- Python packages: `selenium`, `beautifulsoup4`, `python-dateutil`, `tabulate`

Arch Linux:

```bash
sudo pacman -S firefox geckodriver python
```

## Clone and Install

```bash
git clone https://github.com/NonLaHu/ctf_fetch.git
cd ctf_fetch
python3 -m venv .venv
source .venv/bin/activate
pip install selenium beautifulsoup4 python-dateutil tabulate
```

## Run

```bash
python3 fetch.py
```

The script starts headless Firefox, reads CTFtime's upcoming online events, keeps events starting within the next 7 days, then fetches each event's details. Expect a delay of roughly half a second per event.

## Configuration

The constants at the top of `fetch.py` control behavior:

| Constant | Default | Purpose |
| --- | --- | --- |
| `CTFTIME_URL` | CTFtime upcoming online list | Source page |
| `WINDOW` | 7 days | How far ahead to look |
| `USD_TO_MMK` | 4500 | Approximate currency conversion |
| `REQUEST_TIMEOUT` | 25 seconds | Page-load timeout |
| `DEBUG` | `True` | Print progress/diagnostic messages |

## Output

The table includes event name, MMT date range, duration, format, official website, and prize (with an approximate MMK value for USD prizes).

## Helper Scripts

- `debug1.py` — minimal Firefox/headless page-load test.
- `debug.py` — earlier debug variant; it mixes Chrome options with Firefox and is kept for reference.

## Notes

- CTFtime HTML changes can break the parsers.
- No requirements file is committed; install the four packages listed above.
- Headless Firefox must be able to start, so verify `geckodriver` is on `PATH` if the script fails immediately.

# git_dirty

**Repo:** https://github.com/NonLaHu/git_dirty
**Visibility:** Public
**Stack:** Bash

An interactive helper that creates a commit dated on a chosen day of the current month, using the current time in Myanmar Time. It stages all changes and commits them with a `Day DD: <message>` subject.

## Requirements

- Bash
- Git
- A repository with changes to commit

## Clone

```bash
git clone https://github.com/NonLaHu/git_dirty.git
```

## Use

Run the script from the repository you want to commit to:

```bash
cd /path/to/your/repo
bash /path/to/git_dirty/dirty.sh
```

Or make it available as a command:

```bash
chmod +x dirty.sh
mkdir -p ~/.local/bin
ln -sf "$PWD/dirty.sh" ~/.local/bin/git-dirty
```

Then from any repository:

```bash
git-dirty
```

The script prompts for:

1. **Day** — `1` through today's date in the current month.
2. **Commit message** — non-empty text.
3. **Confirmation** — `y` to proceed.

It then:

```bash
git add .
GIT_AUTHOR_DATE="<selected date, current time, Asia/Yangon>" \
GIT_COMMITTER_DATE="<same>" \
git commit -m "Day DD: <message>"
```

## Notes

- The date is limited to the current month and cannot be in the future.
- `TZ="Asia/Yangon"` is hardcoded.
- `git add .` stages everything in the current working tree, including untracked files.
- Only the new commit's author/committer dates are set; existing history is not rewritten.
- Use it only where backdated commits are acceptable, such as a personal daily-log repository.

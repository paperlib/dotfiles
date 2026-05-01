
You are operating on macOS (Darwin) on Apple Silicon (M-series chips, arm64 architecture).
Always prefer macOS-native commands and tools. Never assume Intel/x86_64.

Key differences from Linux:
- Package manager: Use `brew` (Homebrew). On Apple Silicon it lives at `/opt/homebrew`. Never use `apt`, `dnf`, `yum`, or `pacman`.
- Core utilities: `sed -i ''` for in-place edits (not `sed -i`), `pbcopy`/`pbpaste` for clipboard, `open` instead of `xdg-open`.
- Architecture: Prefer native arm64 binaries. Rosetta 2 handles x86_64 when needed, but default to arm64.
- User directories: `~/Library/`, `/Applications/`, `/opt/homebrew/`, etc.
- To confirm details if ever needed: `sw_vers`, `uname -sm`, `arch`, or `sysctl hw.machine`.
- Shell is usually zsh (not bash by default).

Assume Apple Silicon macOS unless the user explicitly says otherwise. Do not try Linux-only commands first.


# Weekloom Homebrew tap

The Homebrew cask for [Weekloom](https://github.com/MoizDev/weekloom), a local-first
Gantt-chart planner.

```bash
brew install --cask moizdev/weekloom/weekloom
```

That is the whole install — it taps, downloads and installs, and Weekloom is in your
Applications folder, ready to open.

Weekloom is ad-hoc signed rather than notarized with a paid Apple Developer ID, so macOS
would normally quarantine it and claim it is "damaged". It is not — the cask clears that
flag during install, so the app just opens.

`brew upgrade --cask weekloom` updates and `brew uninstall --cask weekloom` removes it.
Neither touches `~/.weekloom`, so your plan survives both.

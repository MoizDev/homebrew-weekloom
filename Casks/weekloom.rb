cask "weekloom" do
  arch arm: "-arm64", intel: ""

  version "0.1.5"
  sha256 arm:   "c2bb72fc479ef8489523b0ca566d45b258127aa198302ec6b8bebeaac635e94d",
         intel: "f7c261c868a1a79c2176ac48494cda9c7542b6beb72d1f0641ea55e5eb0db716"

  url "https://github.com/MoizDev/weekloom/releases/download/v#{version}/Weekloom-#{version}#{arch}.dmg",
      verified: "github.com/MoizDev/weekloom/"
  name "Weekloom"
  desc "Local-first Gantt-chart planner that makes no network requests"
  homepage "https://github.com/MoizDev/weekloom"

  depends_on macos: :big_sur

  app "Weekloom.app"

  # ⚠️ `~/.weekloom` is deliberately NOT listed here. It is the user's entire
  # plan — the one SQLite file this application exists to keep — and an
  # uninstall must not take it. Someone reinstalling gets their boards back.
  zap trash: [
    "~/Library/Application Support/weekloom",
    "~/Library/Preferences/com.weekloom.desktop.plist",
    "~/Library/Saved Application State/com.weekloom.desktop.savedState",
  ]

  # ⚠️ Weekloom is ad-hoc signed, not signed with a paid Apple Developer ID, so
  # macOS quarantines it and Gatekeeper refuses to launch it — reporting that
  # the app is "damaged", which is false and which people reasonably act on by
  # deleting it. Homebrew removed `--no-quarantine` and offers no cask-level
  # way to decline the attribute, so clearing it here is the only way the
  # install can be a single command that produces a working app.
  #
  # This is exactly what the user would otherwise be told to type themselves.
  # Delete this block the day the app is notarized — it stops being needed, and
  # a cask that strips quarantine from a NOTARIZED app is only throwing away a
  # real signal.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Weekloom.app"],
                   sudo: false
  end

  caveats <<~EOS
    Weekloom is ad-hoc signed rather than notarized with a paid Apple Developer
    ID. The quarantine flag that would make macOS call it "damaged" has been
    cleared for you, so it should just open.
  EOS
end

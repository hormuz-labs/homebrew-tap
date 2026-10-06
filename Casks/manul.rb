cask "manul" do
  version "0.1.1"

  on_arm do
    sha256 "2f3efa71609b163cfc42b7ce6ded052da28e02a020d4b4ec3e3f3d88bdf4307d"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ceaa8ea090bc7b11aedfd2c0d9ccbab006561bdf1062b1e6e3e1fd066e33e8a0"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-x64.dmg"
  end

  name "Manul"
  desc "Agentic video editor: drop in a video, say what you want, and it does the edit"
  homepage "https://github.com/hormuz-labs/manul"

  auto_updates true
  depends_on macos: :monterey

  app "Manul.app"

  # Not notarized yet: without this, macOS calls the downloaded app "damaged". Drop once releases are signed.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Manul.app"],
        chdir:          "{{appdir}}",
        writable_paths: ["Manul.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/Manul",
    "~/Library/Caches/manul-updater",
    "~/Library/Logs/Manul",
    "~/Library/Preferences/com.hormuzlabs.manul.plist",
    "~/Library/Saved Application State/com.hormuzlabs.manul.savedState",
  ]
end

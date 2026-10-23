cask "manul" do
  version "0.4.8"

  on_arm do
    sha256 "6a647392347a3e6b644a81baf745cd4c535f766f9b6c5a5c1876ca404a6f8803"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "331c8f33297d8dae696f62fe37907c4ed4d39ae59ef328908de8166fb31a7fe3"

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

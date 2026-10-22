cask "manul" do
  version "0.4.7"

  on_arm do
    sha256 "6d510827e8df5f4490446dd87f400fbedbe01b2f5f4c6222672794638c48c01a"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "dcec9b5404f229636473c90736bd908a0ad6bde3c9bf70ee06db403130f0b472"

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

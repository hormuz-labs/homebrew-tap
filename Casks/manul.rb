cask "manul" do
  version "0.4.11"

  on_arm do
    sha256 "57b303bec106e65e4ef35c5be9e033abf322bd82c94089a3d257fded2c2a65c5"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6e086a2ef7c2ae85317d7200adfd841746d1e3808043a3897cc304c2827b2baa"

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

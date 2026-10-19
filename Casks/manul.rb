cask "manul" do
  version "0.4.4"

  on_arm do
    sha256 "45fd5cd8815d63ce99f84dc5bae490385b1f380635e91691f91214d6ddd3a276"

    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "818f38d810534da8fea2c7ac9aadbc064226d325c6abf835e9bd015b9091fdc2"

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

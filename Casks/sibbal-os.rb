cask "sibbal-os" do
  version "0.1.6"

  on_arm do
    sha256 "c3424c0a177917be49dad3ebc6ab90b8fcef0e49eb8b6ed54e898df2fd993e3c"

    url "https://github.com/hormuz-labs/sibbal-os-releases/releases/download/v#{version}/Sibbal-OS-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "239013fee482fd2071a85da2f8e6efaf72157ead71c7d27b7644036f9d920e99"

    url "https://github.com/hormuz-labs/sibbal-os-releases/releases/download/v#{version}/Sibbal-OS-#{version}-x64.dmg"
  end

  name "Sibbal OS"
  desc "Private desktop workspace for legal work"
  homepage "https://manul.si/sibbal"

  auto_updates true
  depends_on macos: :monterey

  app "Sibbal OS.app"

  # Matters live in ~/Documents/Sibbal OS and are the user's work, so zap leaves them alone.
  zap trash: [
    "~/Library/Application Support/Sibbal OS",
    "~/Library/Caches/sibbal-os-updater",
    "~/Library/Logs/Sibbal OS",
    "~/Library/Preferences/com.hormuzlabs.sibbalos.plist",
    "~/Library/Saved Application State/com.hormuzlabs.sibbalos.savedState",
  ]
end

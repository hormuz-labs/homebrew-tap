cask "manul" do
  version "0.1.0"

  on_arm do
    sha256 "2ec332ebc9de36123b4839a3e7e29ea75ec1413a108403ebb568caf881fe9f38"
    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "515f2769f60b727f27a87903dff4f608b36c634eb761afad794a46fea4465057"
    url "https://github.com/hormuz-labs/manul/releases/download/v#{version}/Manul-#{version}-x64.dmg"
  end

  name "Manul"
  desc "Agentic video editor: drop in a video, say what you want, and it does the edit"
  homepage "https://github.com/hormuz-labs/manul"

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Manul.app"

  # builds aren't notarized yet: without this macOS calls the downloaded app "damaged". Drop it once releases are signed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Manul.app"]
  end

  zap trash: [
    "~/Library/Application Support/Manul",
    "~/Library/Caches/manul-updater",
    "~/Library/Logs/Manul",
    "~/Library/Preferences/com.hormuzlabs.manul.plist",
    "~/Library/Saved Application State/com.hormuzlabs.manul.savedState",
  ]
end

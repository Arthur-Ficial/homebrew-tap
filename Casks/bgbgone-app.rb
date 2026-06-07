cask "bgbgone-app" do
  version "0.3.1"
  sha256 "cc3c14f05025a9c1ae9fcefe9f12cf6e04be3c7932047866895c3861f91f74f3"

  url "https://github.com/Arthur-Ficial/bgbgone-app/releases/download/v#{version}/bgbgone-app-v#{version}-macos-arm64.zip"
  name "bgbgone"
  desc "macOS GUI for the bgbgone background removal CLI (Apple Vision, on-device, batchable)"
  homepage "https://github.com/Arthur-Ficial/bgbgone-app"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "bgbgone-app.app"

  zap trash: [
    "~/Library/Application Support/bgbgone-app",
    "~/Library/Preferences/com.fullstackoptimization.bgbgone-app.plist",
    "~/Library/Caches/com.fullstackoptimization.bgbgone-app",
  ]
end

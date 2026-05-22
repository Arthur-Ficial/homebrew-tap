cask "bgbgone-app" do
  version "0.1.0"
  sha256 "f28e1575f61aa372a3dd2f07db22a7fcc50b7e96f0c81ae2ec86e17536d34d5b"

  url "https://github.com/Arthur-Ficial/bgbgone.app/releases/download/v#{version}/bgbgone-app-v#{version}-macos-arm64.zip"
  name "bgbgone"
  desc "macOS GUI for the bgbgone background removal CLI (Apple Vision, on-device, batchable)"
  homepage "https://github.com/Arthur-Ficial/bgbgone.app"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "bgbgone-app.app"

  zap trash: [
    "~/Library/Application Support/bgbgone-app",
    "~/Library/Preferences/com.fullstackoptimization.bgbgone-app.plist",
    "~/Library/Caches/com.fullstackoptimization.bgbgone-app",
  ]
end

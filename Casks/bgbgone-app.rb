cask "bgbgone-app" do
  version "0.3.3"
  sha256 "06dab1338904fa32245594f0d0022270c569e392754241f6b286fe82d23c64c6"

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

cask "bgbgone-app" do
  version "0.3.0"
  sha256 "f9af4b77610b5200c1c62a0ba762cfbf6cb882836d01c5aa99f697a75e2811d5"

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

cask "bgbgone-app" do
  version "0.3.2"
  sha256 "5bb18580038b5e399accc7a71034c49f558c457341e3229101918247484fee19"

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

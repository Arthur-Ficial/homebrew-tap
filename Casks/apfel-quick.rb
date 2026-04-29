cask "apfel-quick" do
  version "1.0.9"
  sha256 "828b3b64bf39a27c9ae70852755fc1507074bce2209d17665950f5e9c7b9c395"

  url "https://github.com/Arthur-Ficial/apfel-quick/releases/download/v#{version}/apfel-quick-macos-arm64.zip"
  name "apfel-quick"
  desc "Instant AI overlay for macOS — press a key, ask anything"
  homepage "https://apfel-quick.franzai.com"

  auto_updates false
  depends_on arch: :arm64

  app "apfel-quick.app"

  zap trash: [
    "~/Library/Application Support/apfel-quick",
    "~/Library/Preferences/com.arthurficial.apfel-quick.plist",
  ]
end

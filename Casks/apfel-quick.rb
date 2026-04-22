cask "apfel-quick" do
  version "1.0.5"
  sha256 "1e4e185d35ee129c1232b45bf3fead53581fa5d1207f73253f5f2e1e09a139f0"

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

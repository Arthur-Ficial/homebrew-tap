cask "apfel-quick" do
  version "1.0.7"
  sha256 "15768818f26f5efc813a74c82240fead3231135ba554559f0642c497b23f3e96"

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

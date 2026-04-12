cask "apfel-quick" do
  version "1.0.2"
  sha256 "81b0e578402b007104595912e8125a548f6120f771696a701ce6e3c0b7790ba2"

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

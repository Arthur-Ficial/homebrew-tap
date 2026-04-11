cask "apfel-quick" do
  version "1.0.0"
  sha256 "21bcaebca11e6c31e75e34d875d57d28562d6e22443de9f6637662227029a5ee"

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

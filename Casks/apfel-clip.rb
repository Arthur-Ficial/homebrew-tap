cask "apfel-clip" do
  version "0.3.9"
  sha256 "7ea1656fe9fd0f18f22422a1f1c2eb0c55a92949870831c59c61012e71312511"

  url "https://github.com/Arthur-Ficial/apfel-clip/releases/download/v#{version}/apfel-clip-macos-arm64.zip"
  name "apfel-clip"
  desc "AI-powered clipboard actions from the macOS menu bar"
  homepage "https://apfel-clip.franzai.com"

  auto_updates false
  depends_on arch: :arm64

  app "apfel-clip.app"
  binary "apfel-clip.app/Contents/MacOS/apfel-clip"

  zap trash: [
    "~/Library/Application Support/apfel-clip",
    "~/Library/Preferences/com.arthurficial.apfel-clip.plist",
  ]
end

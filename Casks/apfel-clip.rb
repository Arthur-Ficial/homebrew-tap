cask "apfel-clip" do
  version "0.6.0"
  sha256 "3b5830299a5a71a39366a29b3f704cef7516b2e179115b02486ecdf783298ba4"

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

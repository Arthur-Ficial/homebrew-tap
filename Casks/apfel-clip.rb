cask "apfel-clip" do
  version "0.3.8"
  sha256 "367271f7882cb1bb73aa8c700141067f0e9cc08f167fd801821f30d6b231d3b6"

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

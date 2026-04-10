cask "apfel-clip" do
  version "0.3.1"
  sha256 "c76e4141fc9b86ee5eddfbc7935468dc9000d3fccf2d2ec90da9e9555a688772"

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

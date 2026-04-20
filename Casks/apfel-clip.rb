cask "apfel-clip" do
  version "0.5.0"
  sha256 "a28c4b9f6929cdb4aaf40c13aca0837679f32c996c5e796c4af8e291f0deb73b"

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

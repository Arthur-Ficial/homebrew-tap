cask "apfelpad" do
  version "0.5.3"
  sha256 "569b1f1861a9f421c365684cf533af37265da37e998a56f80724d3b1e26324b0"

  url "https://github.com/Arthur-Ficial/apfelpad/releases/download/v#{version}/apfelpad-macos-arm64.zip"
  name "apfelpad"
  desc "A formula notepad for thinking — on-device AI as a first-class function"
  homepage "https://apfelpad.franzai.com"

  auto_updates false
  depends_on arch: :arm64

  app "apfelpad.app"
  binary "apfelpad.app/Contents/MacOS/apfelpad"

  zap trash: [
    "~/Library/Application Support/apfelpad",
    "~/Library/Preferences/com.fullstackoptimization.apfelpad.plist",
  ]
end

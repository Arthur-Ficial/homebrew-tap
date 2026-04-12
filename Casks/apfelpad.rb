cask "apfelpad" do
  version "0.5.0"
  sha256 "0254a1aeac4d2eed3ee964eeb94f475e5578a01cc8ce1fce9b59a64826b2ba39"

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

cask "apfelpad" do
  version "0.1.0"
  sha256 "ce822082055fe09c0b34fe043b12620451082a2302ccb193355938684aebf0ba"

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

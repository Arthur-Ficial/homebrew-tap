cask "apfelpad" do
  version "0.5.7"
  sha256 "7f7d930bcacf3a243ba830855aa3c87ecf511f865b3dbbd1f4c976bd42b1b692"

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

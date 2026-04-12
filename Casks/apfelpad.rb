cask "apfelpad" do
  version "0.3.4"
  sha256 "e76ea9bf470bd9d67221c4c7eda5c2bc2fc3263a038b2dbbad4380ca4ef105bb"

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

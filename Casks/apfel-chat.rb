cask "apfel-chat" do
  version "1.1.7"
  sha256 "87e03c4489a6cf584b767541373cb55473e3ccca4a24f154aec7037a7bd2da5c"

  url "https://github.com/Arthur-Ficial/apfel-chat/releases/download/v#{version}/apfel-chat-macos-arm64.zip"
  name "apfel-chat"
  desc "Super-fast on-device AI chat for macOS — powered by apfel"
  homepage "https://apfel-chat.franzai.com"

  auto_updates false
  depends_on arch: :arm64

  app "apfel-chat.app"
  binary "apfel-chat.app/Contents/MacOS/apfel-chat"

  zap trash: [
    "~/Library/Application Support/apfel-chat",
    "~/Library/Preferences/com.fullstackoptimization.apfel-chat.plist",
  ]
end

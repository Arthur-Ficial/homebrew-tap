cask "apfel-chat" do
  version "1.1.8"
  sha256 "9b6b2358eedfca1d46e23e396912b0373ef8b9e42c85e6a3118bb8b12f12f0a5"

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

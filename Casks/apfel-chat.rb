cask "apfel-chat" do
  version "1.1.11"
  sha256 "d677683f75224e5390f4f70b3aea8df2e4bb908b6e5bab563de7e6d17b2adfdb"

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

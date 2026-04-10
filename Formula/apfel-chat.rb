cask "apfel-chat" do
  version "1.1.4"
  sha256 "44138ec0ff93ce75f93555c0b783527ce8c361c26884b5b056253130b8f0f6ab"

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

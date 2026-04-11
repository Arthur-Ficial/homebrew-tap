cask "apfel-chat" do
  version "1.1.10"
  sha256 "4ea8f26f43afeb8a8f06556a9a11c7782dd3feacd3682ee12c2fee03a6859f22"

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

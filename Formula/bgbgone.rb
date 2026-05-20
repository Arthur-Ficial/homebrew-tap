class Bgbgone < Formula
  desc "Ultimate UNIX-style background remover for macOS — on-device Apple Vision + Image Playground"
  homepage "https://github.com/Arthur-Ficial/bgbgone"
  url "https://github.com/Arthur-Ficial/bgbgone/releases/download/v0.1.1/bgbgone-0.1.1-arm64-macos.tar.gz"
  sha256 "7b3578aabc2d28970fc32e56b17e3f1104bdfcf88bffbec6c647b5016534be68"
  license "MIT"

  def install
    odie "bgbgone requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "bgbgone"
  end

  def caveats
    <<~EOS
      bgbgone runs entirely on-device using Apple's Vision framework and
      (optionally) Image Playground. No API keys, no network, no accounts.

      Verify with:
        bgbgone --version
        bgbgone --check
        bgbgone /path/to/photo.jpg -o cutout.png

      For --bg gen:"..." generative backgrounds, enable Apple Intelligence
      in System Settings → Apple Intelligence & Siri (requires macOS 15.2+).
    EOS
  end

  test do
    assert_match "bgbgone v", shell_output("#{bin}/bgbgone --version")
    assert_match "USAGE:", shell_output("#{bin}/bgbgone --help")
    assert_match "capability report", shell_output("#{bin}/bgbgone --check")
  end
end

class Bgbgone < Formula
  desc "Ultimate UNIX-style background remover for macOS — on-device Apple Vision, 100% scriptable"
  homepage "https://github.com/Arthur-Ficial/bgbgone"
  url "https://github.com/Arthur-Ficial/bgbgone/releases/download/v0.1.11/bgbgone-0.1.11-arm64-macos.tar.gz"
  sha256 "7d2d2a7abc958ec6be97191d0cf15d6ff48f7c517a8e99a3f3d2708542bedd8a"
  license "MIT"

  def install
    odie "bgbgone requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "bgbgone"
  end

  def caveats
    <<~EOS
      bgbgone runs entirely on-device using Apple's Vision framework.
      No API keys, no network, no accounts. No GUI side-effects — every
      invocation is silent and scriptable.

      Verify with:
        bgbgone --version
        bgbgone --check
        bgbgone /path/to/photo.jpg -o cutout.png

      To use a generated or hand-painted background, save it as a PNG / JPG
      and compose with --bg image:<path>.
    EOS
  end

  test do
    assert_match "bgbgone v", shell_output("#{bin}/bgbgone --version")
    assert_match "USAGE:", shell_output("#{bin}/bgbgone --help")
    assert_match "capability report", shell_output("#{bin}/bgbgone --check")
  end
end

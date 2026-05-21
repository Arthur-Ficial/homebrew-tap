class Bgbgone < Formula
  desc "Ultimate UNIX-style background remover for macOS — on-device Apple Vision, 100% scriptable"
  homepage "https://github.com/Arthur-Ficial/bgbgone"
  url "https://github.com/Arthur-Ficial/bgbgone/releases/download/v0.1.8/bgbgone-0.1.8-arm64-macos.tar.gz"
  sha256 "0bc59fccf2433d244d073ce3ff91f0e281cebe02cf4e422806f8b6abb163e36b"
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

      For a generated background, pre-generate the image in any tool (Apple's
      standalone Image Playground app, etc.) and compose with --bg image:<path>.
      --bg gen: was removed in v0.1.2 — see the README for the full reasoning.
    EOS
  end

  test do
    assert_match "bgbgone v", shell_output("#{bin}/bgbgone --version")
    assert_match "USAGE:", shell_output("#{bin}/bgbgone --help")
    assert_match "capability report", shell_output("#{bin}/bgbgone --check")
  end
end

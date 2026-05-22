class Bgbgone < Formula
  desc "On-device Apple Vision background remover for macOS"
  homepage "https://github.com/Arthur-Ficial/bgbgone"
  url "https://github.com/Arthur-Ficial/bgbgone/releases/download/v0.1.36/bgbgone-0.1.36-arm64-macos.tar.gz"
  sha256 "ee25cb5c4bb064101eaf7e379a67d91aacd0f5071882df93d59d2fe7521fcca6"
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

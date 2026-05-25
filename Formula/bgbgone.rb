class Bgbgone < Formula
  desc "On-device Apple Vision background remover for macOS"
  homepage "https://github.com/Arthur-Ficial/bgbgone"
  url "https://github.com/Arthur-Ficial/bgbgone/releases/download/v1.1.19/bgbgone-1.1.19-arm64-macos.tar.gz"
  sha256 "68e5810c0dcf36a47cac9bc65fd3e55f23cd9aa24e96b93322daf5e5fbaf051e"
  license "MIT"

  def install
    odie "bgbgone requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "bgbgone"
  end

  def caveats
    <<~EOS
      bgbgone runs entirely on-device using Apples Vision framework.
      No API keys, no network, no accounts. No GUI side-effects - every
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
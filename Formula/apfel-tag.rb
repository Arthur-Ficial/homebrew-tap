class ApfelTag < Formula
  desc "On-device content tagging CLI - classify piped text into tags"
  homepage "https://github.com/Arthur-Ficial/apfel-tag"
  url "https://github.com/Arthur-Ficial/apfel-tag/releases/download/v0.1.0/apfel-tag-0.1.0-arm64-macos.tar.gz"
  sha256 "5d08c377c1dfe5b69af8f0f8ad084b1548bc6fce3b178cd3ae120160cc367601"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on macos: :tahoe

  def install
    bin.install "apfel-tag"
    man1.install "apfel-tag.1"
  end

  def caveats
    <<~EOS
      apfel-tag classifies piped text into tags using Apple's on-device
      content-tagging model. No API keys, no network - 100% local.

      Usage:
        echo "Your text here" | apfel-tag
        echo "Your text here" | apfel-tag -o json | jq -r '.tags[]'
        echo "Your text here" | apfel-tag --kind emotions

      Requires macOS 26+ on Apple Silicon with Apple Intelligence enabled.
    EOS
  end

  test do
    assert_match "apfel-tag v#{version}", shell_output("#{bin}/apfel-tag --version")
    assert_path_exists man1/"apfel-tag.1"
  end
end

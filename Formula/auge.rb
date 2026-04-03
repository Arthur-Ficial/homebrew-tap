class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcode, and face detection"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v0.0.4/auge-0.0.4-arm64-macos.tar.gz"
  sha256 "492d856e0f1d403509ec7440431b6bf20ad2e1b4fba4c74de7f1f6ce4bfd654c"
  license "MIT"

  def install
    odie "auge requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "auge"
  end

  def caveats
    <<~EOS
      auge runs entirely on-device using Apple's Vision framework.
      No API keys or network access required.

      Verify with:
        auge --version
        auge --ocr /path/to/image.png
    EOS
  end

  test do
    assert_match "auge v0.0.4", shell_output("#{bin}/auge --version")
  end
end

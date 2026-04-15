class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcode, and face detection"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v0.0.7/auge-0.0.7-arm64-macos.tar.gz"
  sha256 "97a860534c83d00836a199d0c2fb2c6b5e37a93115909eab4fcc61c143c4dd54"
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
    assert_match "auge v0.0.6", shell_output("#{bin}/auge --version")
  end
end

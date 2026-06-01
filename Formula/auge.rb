class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcode, and face detection"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v1.8.0/auge-1.8.0-arm64-macos.tar.gz"
  sha256 "4cedceb9268b6bb558da5d80343b06cd36fced7650189419dd89c320b564bd8a"
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
    assert_match "auge v1.8.0", shell_output("#{bin}/auge --version")
  end
end

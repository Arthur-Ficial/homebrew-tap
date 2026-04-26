class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcodes, and faces"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v1.1.0/auge-1.1.0-arm64-macos.tar.gz"
  sha256 "65c61e5608c925db7a5609a8312b0f5ae7931fcfb74b45fab550bd08773bc68a"
  license "MIT"

  def install
    odie "auge requires Apple Silicon." unless Hardware::CPU.arm?
    bin.install "auge"
  end

  def caveats
    <<~CAVEAT
      auge runs entirely on-device using Apple's Vision framework.
      No API keys or network access required.

      Quick start:
        auge --version
        auge --all /path/to/image.png
        auge --ocr scan.pdf
    CAVEAT
  end

  test do
    assert_match "auge v1.1.0", shell_output("#{bin}/auge --version")
  end
end
class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcodes, and faces"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v1.1.2/auge-1.1.2-arm64-macos.tar.gz"
  sha256 "485282a1f0e2505322b448fa3cb0e4b345af11d923716b66baa0eca951bef307"
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
        auge --ocr --langs en-US,zh-Hant,de-DE multilingual.png
    CAVEAT
  end

  test do
    assert_match "auge v1.1.2", shell_output("#{bin}/auge --version")
  end
end
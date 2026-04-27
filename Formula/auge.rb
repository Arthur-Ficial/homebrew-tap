class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcode, and face detection"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v1.2.0/auge-1.2.0-arm64-macos.tar.gz"
  sha256 "95956c1aa87d9ba9223d70919a6ccb765fac2cb7b116ab3fa89ecdfd84438b51"
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
    assert_match "auge v1.2.0", shell_output("#{bin}/auge --version")
  end
end

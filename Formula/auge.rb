class Auge < Formula
  desc "On-device Apple Vision CLI for OCR, classification, barcode, and face detection"
  homepage "https://github.com/Arthur-Ficial/auge"
  url "https://github.com/Arthur-Ficial/auge/releases/download/v1.3.0/auge-1.3.0-arm64-macos.tar.gz"
  sha256 "18f124624a5b412883454f3753fd5895b08c656b3a78281c989ae6528ff38d0a"
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
    assert_match "auge v1.3.0", shell_output("#{bin}/auge --version")
  end
end

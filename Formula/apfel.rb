class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.6.30/apfel-0.6.30-arm64-macos.tar.gz"
  sha256 "6111da3eae4b2e8e4a9f3817c378611816b607aca0a6beacd0a5ca07f38d9e21"
  license "MIT"

  def install
    odie "apfel requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "apfel"
  end

  def caveats
    <<~EOS
      apfel runs entirely on-device and requires Apple Intelligence to be enabled.

      Check model availability with:
        apfel --model-info
    EOS
  end

  test do
    assert_match "apfel v0.6.30", shell_output("#{bin}/apfel --version")
  end
end

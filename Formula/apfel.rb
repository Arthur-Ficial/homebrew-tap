class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.7.2/apfel-0.7.2-arm64-macos.tar.gz"
  sha256 "7cfb22d69e74d6591031d4c8aa2155054ab739a3f9c2d43944c4ad0a7e10b473"
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
    assert_match "apfel v0.7.2", shell_output("#{bin}/apfel --version")
  end
end

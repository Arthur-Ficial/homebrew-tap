class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.8.7/apfel-0.8.7-arm64-macos.tar.gz"
  sha256 "037fb7f5982cbcc8716cda9ba6e42e59e09ee8747dda9082f7ad2a5f3bf47cca"
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
    assert_match "apfel v0.8.7", shell_output("#{bin}/apfel --version")
  end
end

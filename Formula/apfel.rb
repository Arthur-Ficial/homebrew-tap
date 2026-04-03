class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.6.24/apfel-0.6.24-arm64-macos.tar.gz"
  sha256 "c2d9f4995c9c107660b704c75582e22ac29fc9d4e5475cb8445c6dfc264840e0"
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
    assert_match "apfel v0.6.24", shell_output("#{bin}/apfel --version")
  end
end

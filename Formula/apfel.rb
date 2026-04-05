class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.8.2/apfel-0.8.2-arm64-macos.tar.gz"
  sha256 "2974de26c381e702773a675d6a550accd99661f26e45ea033fa74f113dbc9ab1"
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
    assert_match "apfel v0.8.2", shell_output("#{bin}/apfel --version")
  end
end

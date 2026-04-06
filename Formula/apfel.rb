class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.9.0/apfel-0.9.0-arm64-macos.tar.gz"
  sha256 "c6e08407510b7e0fbca06a37f34b7666baa90f3750d56fab29d6dfb9148cec57"
  license "MIT"

  def install
    bin.install "apfel"
  end

  def caveats
    s = <<~EOS
      apfel runs entirely on-device and requires Apple Intelligence to be enabled.

      Check model availability with:
        apfel --model-info
    EOS
    unless Hardware::CPU.arm?
      s += <<~EOS

        WARNING: This binary was built for Apple Silicon (arm64).
        It may not work on this architecture.
      EOS
    end
    s
  end

  test do
    assert_match "apfel v0.9.0", shell_output("#{bin}/apfel --version")
  end
end

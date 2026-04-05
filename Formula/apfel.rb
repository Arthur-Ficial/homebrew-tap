class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.8.1/apfel-0.8.1-arm64-macos.tar.gz"
  sha256 "7a0d55612ec0e81201fd78947c8ed6536bddcd88d697396ad9538ab4a8073f84"
  license "MIT"

  def install
    odie "apfel requires ARM Homebrew on Apple Silicon. If you're on an M-series Mac with Homebrew at /usr/local, reinstall Homebrew at /opt/homebrew." unless Hardware::CPU.arm?

    bin.install "apfel"
  end

  def caveats
    <<~EOS
      apfel runs entirely on-device. Requirements:
        - macOS 26 (Tahoe) or newer
        - Apple Silicon (M1/M2/M3/M4)
        - Apple Intelligence enabled:
            System Settings > Apple Intelligence & Siri > toggle ON

      Check model availability with:
        apfel --model-info

      If you see "model not ready", the on-device model may still be
      downloading. Wait a few minutes and try again.
    EOS
  end

  test do
    assert_match "apfel v0.8.1", shell_output("#{bin}/apfel --version")
  end
end

class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.7.2/apfel-0.7.2-arm64-macos.tar.gz"
  sha256 "7cfb22d69e74d6591031d4c8aa2155054ab739a3f9c2d43944c4ad0a7e10b473"
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
    assert_match "apfel v0.7.2", shell_output("#{bin}/apfel --version")
  end
end

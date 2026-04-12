class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.9.17/apfel-0.9.17-arm64-macos.tar.gz"
  sha256 "9360b6c0a978d832c3b6a1ff6f431c19dd24ea60f2457e873c66d2281b6c8284"
  license "MIT"

  depends_on :macos
  depends_on macos: :tahoe

  def install
    bin.install "apfel"
  end

  service do
    run [opt_bin/"apfel", "--serve"]
    keep_alive true
    log_path var/"log/apfel.log"
    error_log_path var/"log/apfel.log"
  end

  def caveats
    s = <<~EOS
      apfel requires:
        - macOS 26 Tahoe or newer (enforced by this formula)
        - Apple Silicon (M1 or later) - Tahoe is Apple Silicon only
        - Apple Intelligence enabled in System Settings > Apple Intelligence & Siri

      Verify everything is ready:
        apfel --model-info

      If the model is unavailable, enable Apple Intelligence:
        https://support.apple.com/en-us/121115
    EOS
    unless Hardware::CPU.arm?
      s += <<~EOS

        Note: Homebrew reports this process as non-arm64. If you are on a real
        Apple Silicon Mac (M1+), apfel will still run - your brew install may
        be running under Rosetta. See:
        https://github.com/Arthur-Ficial/apfel/issues/45
      EOS
    end
    s
  end

  test do
    assert_match "apfel v0.9.17", shell_output("#{bin}/apfel --version")
  end
end

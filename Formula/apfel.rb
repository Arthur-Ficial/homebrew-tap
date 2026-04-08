class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.9.4/apfel-0.9.4-arm64-macos.tar.gz"
  sha256 "ed3bd8b22977dd6fb77384633576fc305381d3340f85f5d4b3f371523b6676b5"
  license "MIT"

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
    assert_match "apfel v0.9.4", shell_output("#{bin}/apfel --version")
  end
end

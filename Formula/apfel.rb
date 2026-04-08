class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.9.6/apfel-0.9.6-arm64-macos.tar.gz"
  sha256 "295b01e7b85933d70f6f2a298525989e2f7c8c8c67ddc04562be7c292468a0da"
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
    assert_match "apfel v0.9.6", shell_output("#{bin}/apfel --version")
  end
end

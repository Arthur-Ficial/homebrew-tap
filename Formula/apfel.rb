class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.9.1/apfel-0.9.1-arm64-macos.tar.gz"
  sha256 "ef5c8b2ab8f4d8db5fbac779295ced72ddf5f0ef355ad1052df7ec173b298a98"
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
    assert_match "apfel v0.9.1", shell_output("#{bin}/apfel --version")
  end
end

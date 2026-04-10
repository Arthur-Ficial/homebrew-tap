class Ohr < Formula
  desc "On-device speech-to-text CLI and OpenAI-compatible transcription server"
  homepage "https://github.com/Arthur-Ficial/ohr"
  url "https://github.com/Arthur-Ficial/ohr/releases/download/v0.1.3/ohr-0.1.3-arm64-macos.tar.gz"
  sha256 "8e6811b891192e7399dbeeeb97921f3e26cca4fc56a2ea8f12deafe5b560787a"
  license "MIT"

  def install
    odie "ohr requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "ohr"
  end

  def caveats
    <<~EOS
      ohr runs entirely on-device and requires macOS 26+ with Apple Silicon.

      Check model availability with:
        ohr --model-info
    EOS
  end

  test do
    assert_match "ohr 0.1.3", shell_output("#{bin}/ohr --version")
  end
end

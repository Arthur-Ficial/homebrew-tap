class Ohr < Formula
  desc "On-device speech-to-text CLI and OpenAI-compatible transcription server"
  homepage "https://github.com/Arthur-Ficial/ohr"
  url "https://github.com/Arthur-Ficial/ohr/releases/download/v0.1.6/ohr-0.1.6-arm64-macos.tar.gz"
  sha256 "5e9d06cb986dcf2d7f9c6ebc383bbe862a9175546ee72c8974bb4c82f5f4b99b"
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

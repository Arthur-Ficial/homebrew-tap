class Apfel < Formula
  desc "On-device Apple FoundationModels CLI and OpenAI-compatible server"
  homepage "https://github.com/Arthur-Ficial/apfel"
  url "https://github.com/Arthur-Ficial/apfel/releases/download/v0.6.34/apfel-0.6.34-arm64-macos.tar.gz"
  sha256 "b03e35e5c430cb86a33216627002dfb6e7921b8a73de272b7837fd844389180e"
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
    assert_match "apfel v0.6.34", shell_output("#{bin}/apfel --version")
  end
end

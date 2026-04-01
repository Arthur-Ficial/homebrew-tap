class ApfelClip < Formula
  desc "AI-powered clipboard actions from the menu bar - powered by apfel"
  homepage "https://github.com/Arthur-Ficial/apfel-clip"
  url "https://github.com/Arthur-Ficial/apfel-clip/releases/download/v0.1.0/apfel-clip-0.1.0-arm64-macos.tar.gz"
  sha256 "d97e92526d509feff6d4d09eca84eb245d91db1a1dce864f1bc67b465948e0ea"
  license "MIT"

  depends_on "Arthur-Ficial/tap/apfel"

  def install
    odie "apfel-clip requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "apfel-clip"
  end

  def caveats
    <<~EOS
      apfel-clip is a menu bar app. After installing, run:
        apfel-clip

      It requires apfel to be installed (included as a dependency).
      All AI runs on-device via Apple Intelligence.
    EOS
  end

  test do
    assert_predicate bin/"apfel-clip", :executable?
  end
end

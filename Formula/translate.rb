class Translate < Formula
  desc "On-device Apple Translation CLI plus drop-in HTTP server for DeepL, LibreTranslate, and Google v2"
  homepage "https://github.com/Arthur-Ficial/translate"
  url "https://github.com/Arthur-Ficial/translate/releases/download/v0.2.0/translate-0.2.0-arm64-macos.tar.gz"
  sha256 "ffa54f3ba39186765102d208762e6915ae4306874d19ef0e33948aee50282f39"
  license "MIT"

  def install
    odie "translate requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "translate"
  end

  def caveats
    <<~EOS
      translate runs entirely on-device using Apple's Translation framework.
      No API keys or network access required. Network egress is hard-blocked
      at runtime by NetworkGuard.

      Translation models are downloaded through System Settings:
        General > Language & Region > Translation Languages

      Verify with:
        translate --version
        echo "Hallo Welt." | translate --to en --from de

      Run as a drop-in DeepL/LibreTranslate/Google v2 server:
        translate --serve --port 8989
    EOS
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/translate --version")
  end
end

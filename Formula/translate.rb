class Translate < Formula
  desc "On-device Apple Translation CLI plus drop-in HTTP server for DeepL, LibreTranslate, and Google v2"
  homepage "https://github.com/Arthur-Ficial/translate"
  url "https://github.com/Arthur-Ficial/translate/releases/download/v0.1.1/translate-0.1.1-arm64-macos.tar.gz"
  sha256 "1b2060ba1d39d65d4daf62230b4665c814349083a74a309e57df58c0467b6c5d"
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
    assert_match "0.1.1", shell_output("#{bin}/translate --version")
  end
end

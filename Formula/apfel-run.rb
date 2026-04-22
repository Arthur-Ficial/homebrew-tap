class ApfelRun < Formula
  desc "Wrangler-style config for apfel - every apfel setting in one TOML file"
  homepage "https://github.com/Arthur-Ficial/apfel-run"
  url "https://github.com/Arthur-Ficial/apfel-run/releases/download/v0.2.0/apfel-run-0.2.0-arm64-macos.tar.gz"
  sha256 "597298eb18d4d23dcf8d34911247fe863f277515a11199424b07fd56243a31e1"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on macos: :ventura

  def install
    bin.install "apfel-run"
  end

  def caveats
    <<~EOS
      apfel-run is a configuration wrapper for apfel. Install apfel too if
      you haven't already:

        brew install Arthur-Ficial/tap/apfel

      Then generate a starter config:

        apfel-run config init
        apfel-run config edit     # opens $EDITOR

      And use apfel-run anywhere you'd use apfel:

        apfel-run "what is 42 * 137?"
        apfel-run --serve --port 11434
        apfel-run -p research "summarise this"

      Tip: `alias apfel=apfel-run` in your shell config gives every apfel
      call your full configuration automatically. Full docs:

        https://github.com/Arthur-Ficial/apfel-run
    EOS
  end

  test do
    assert_match "apfel-run #{version}", shell_output("#{bin}/apfel-run --version")
    assert_match "config show", shell_output("#{bin}/apfel-run --help")
    assert_match "valid", shell_output("APFEL_RUN_CONFIG=/dev/null #{bin}/apfel-run config validate")
  end
end

class ApfelRun < Formula
  desc "MCP registry wrapper for apfel - persistent enable/disable semantics"
  homepage "https://github.com/Arthur-Ficial/apfel-run"
  url "https://github.com/Arthur-Ficial/apfel-run/releases/download/v0.1.0/apfel-run-0.1.0-arm64-macos.tar.gz"
  sha256 "5ab1389e7fb8a372f9b7ff3d5e0e4ef9b72674cc45672c935064fa5460272a8b"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on macos: :ventura

  def install
    bin.install "apfel-run"
  end

  def caveats
    <<~EOS
      apfel-run wraps `apfel` with a persistent MCP registry. Install apfel
      first if you have not already:

        brew install Arthur-Ficial/tap/apfel

      Then create your MCP registry:

        mkdir -p ~/.config/apfel
        $EDITOR ~/.config/apfel/mcps.conf

      Example config:

        # one MCP per line, prefix - to disable, # for comments
        /path/to/calculator.py
        /path/to/web.py
        -/path/to/filesystem.py    # disabled

      Then use apfel-run exactly like apfel:

        apfel-run "what is 42 * 137?"
        apfel-run --list
        apfel-run --serve --port 11434

      Tip: `alias apfel=apfel-run` in your shell config gives every apfel
      call the registry automatically. See:
        https://github.com/Arthur-Ficial/apfel-run
    EOS
  end

  test do
    assert_match "apfel-run #{version}", shell_output("#{bin}/apfel-run --version")
    assert_match "--list", shell_output("#{bin}/apfel-run --help")
    # Verify the config-path flag resolves to a reasonable default
    output = shell_output("#{bin}/apfel-run --config-path")
    assert_match %r{/apfel/mcps\.conf}, output
  end
end

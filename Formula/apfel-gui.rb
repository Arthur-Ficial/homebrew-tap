class ApfelGui < Formula
  desc "Native macOS debug GUI for apfel - Apple Intelligence debugging tool"
  homepage "https://github.com/Arthur-Ficial/apfel-gui"
  url "https://github.com/Arthur-Ficial/apfel-gui/releases/download/v1.1.0/apfel-gui-1.1.0-arm64-macos.tar.gz"
  sha256 "3fb7729df6263dc9eb990dc0cf1b8ee841226437965076de76542f4adc283bb4"
  license "MIT"

  depends_on "arthur-ficial/tap/apfel"

  def install
    odie "apfel-gui requires Apple Silicon." unless Hardware::CPU.arm?

    bin.install "apfel-gui"
    (share/"apfel-gui/mcp/debug-tools").install "mcp/debug-tools/server.py"
  end

  def caveats
    <<~EOS
      apfel-gui requires apfel to be installed:
        brew install arthur-ficial/tap/apfel

      Run with:
        apfel-gui

      The GUI auto-discovers MCP servers and starts apfel in the background.
    EOS
  end

  test do
    assert_predicate bin/"apfel-gui", :executable?
  end
end

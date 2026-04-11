class ApfelMcp < Formula
  include Language::Python::Virtualenv

  desc "Token-budget MCP servers for apfel: url-fetch + ddg-search + compound"
  homepage "https://github.com/Arthur-Ficial/apfel-mcp"
  url "https://github.com/Arthur-Ficial/apfel-mcp/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5d1498667c97161bc6a0a0199f56b9d876dcf67125f05d3ed127ca2214c5c9e9"
  license "MIT"

  depends_on "libxml2" # for lxml
  depends_on "libxslt" # for lxml
  depends_on "python@3.12"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13/anyio-4.13.0.tar.gz"
    sha256 "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
  end

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21/beautifulsoup4-4.14.3.tar.gz"
    sha256 "6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/a7/e7/58aadb0c7a4647957ef6a2a7d759f28904992632808328a1ba443a4e44d7/chardet-7.4.1.tar.gz"
    sha256 "cda41132a45dfbf6984dade1f531a4098c813caf266c66cc446d90bb9369cabd"
  end

  resource "cssselect" do
    url "https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6/cssselect-1.4.0.tar.gz"
    sha256 "fdaf0a1425e17dfe8c5cf66191d211b357cf7872ae8afc4c6762ddd8ac47fc92"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/43/42/149c7747977db9d68faee960c1a3391eb25e94d4bb677f8e2df8328e4098/lxml-6.0.3.tar.gz"
    sha256 "a1664c5139755df44cab3834f4400b331b02205d62d3fdcb1554f63439bf3372"
  end

  resource "lxml_html_clean" do
    url "https://files.pythonhosted.org/packages/9a/a4/5c62acfacd69ff4f5db395100f5cfb9b54e7ac8c69a235e4e939fd13f021/lxml_html_clean-0.4.4.tar.gz"
    sha256 "58f39a9d632711202ed1d6d0b9b47a904e306c85de5761543b90e3e3f736acfb"
  end

  resource "markdownify" do
    url "https://files.pythonhosted.org/packages/3f/bc/c8c8eea5335341306b0fa7e1cb33c5e1c8d24ef70ddd684da65f41c49c92/markdownify-1.2.2.tar.gz"
    sha256 "b274f1b5943180b031b699b199cbaeb1e2ac938b75851849a31fd0c3d6603d09"
  end

  resource "readability-lxml" do
    url "https://files.pythonhosted.org/packages/55/3e/dc87d97532ddad58af786ec89c7036182e352574c1cba37bf2bf783d2b15/readability_lxml-0.8.4.1.tar.gz"
    sha256 "9d2924f5942dd7f37fb4da353263b22a3e877ccf922d0e45e348e4177b035a53"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4/soupsieve-2.8.3.tar.gz"
    sha256 "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
  end

  resource "typing_extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      apfel-mcp installs three MCP (Model Context Protocol) servers:
        - apfel-mcp-url-fetch
        - apfel-mcp-ddg-search
        - apfel-mcp-search-and-fetch

      Use them with apfel in chat mode. The flagship compound tool:

        apfel --mcp $(which apfel-mcp-search-and-fetch) \\
              "use the search tool to find ..."

      apfel-mcp-ddg-search is EXPERIMENTAL: DuckDuckGo has no public
      web-search API, so it scrapes their HTML endpoint. Expect
      occasional rate-limit / bot-challenge errors. See the README
      for details:

        https://github.com/Arthur-Ficial/apfel-mcp
    EOS
  end

  test do
    # Each binary must at least respond to `initialize`.
    initialize_request = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{}}' + "\n"
    %w[apfel-mcp-url-fetch apfel-mcp-ddg-search apfel-mcp-search-and-fetch].each do |binary|
      output = pipe_output("#{bin}/#{binary}", initialize_request, 0)
      assert_match "\"protocolVersion\":\"2025-06-18\"", output
      assert_match "\"name\":\"#{binary}\"", output
    end
  end
end

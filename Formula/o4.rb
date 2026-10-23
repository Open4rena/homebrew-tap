class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.43/o4-macos-arm64.tar.gz"
  sha256 "c320020a1f23bdea51d618397fb458e22f55a6a88a7de21774a43c07e3cc0b5f"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.43/o4-linux-arm64.tar.gz"
      sha256 "82a9084c0ffdaa33607726090e1741b86fb1de5ead9aaa7d8b01178c0df38193"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.43/o4-linux-x86_64.tar.gz"
      sha256 "05a0aada7fc454cb6a18bd108fd9f983d56f37f31c49809a188ddeb97acf4c7f"
    end
  end

  # Each archive holds a single platform-named binary; install it as `o4`.
  def install
    bin.install Dir["o4-*"].fetch(0) => "o4"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/o4 --version")
  end
end

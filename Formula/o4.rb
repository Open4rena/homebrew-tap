class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.52/o4-macos-arm64.tar.gz"
  sha256 "bc1859298f961686ca41b5bfe9ad72bfbfa774d5e8bc50ce94ca99b7e20cb618"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.52/o4-linux-arm64.tar.gz"
      sha256 "009c36f44b7f7ad51fbcf356dd17e029dbaa3c5322ada7d989ba633685ed5937"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.52/o4-linux-x86_64.tar.gz"
      sha256 "92a2753a69fe69ea8882c124018fa4e65f460632b5e926e1ec205dbe57e019e2"
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

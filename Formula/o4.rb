class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.75/o4-macos-arm64.tar.gz"
  sha256 "181e789c03de539d56340f19d7ba07a9f972571438204720b53171f369ada22a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.75/o4-linux-arm64.tar.gz"
      sha256 "f907f78c2e4de35b748d6edfc40140a91bd75ac52aabe9b868f5d8ec48a4e5a6"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.75/o4-linux-x86_64.tar.gz"
      sha256 "d991c63088af0e261f8f8a9291a93df08b55c0b539ab249cb4189946db8515f6"
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

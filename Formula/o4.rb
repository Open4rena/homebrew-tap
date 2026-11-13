class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.24/o4-macos-arm64.tar.gz"
  sha256 "5268ce06e3e839b69973c25f903b0c876b352b66dfff9d3860385407d1a760bc"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.24/o4-linux-arm64.tar.gz"
      sha256 "df4501fe7f179f2ac28435564341f6add916c3703fbe46ba12cf5be7bc5e1deb"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.24/o4-linux-x86_64.tar.gz"
      sha256 "7e7173bd6971f445a26c2828b50d671a156765e6c9cb141f92ac57a91b75e3f5"
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

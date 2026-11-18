class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.51/o4-macos-arm64.tar.gz"
  sha256 "6ca68a2d4619cf276887a7c0abfa77f99bb1549752eb03d6413aea302e6858d9"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.51/o4-linux-arm64.tar.gz"
      sha256 "cf9870060778ef89632b606bee0464ce4ef8cbe29c14423b293e5d68994bae98"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.51/o4-linux-x86_64.tar.gz"
      sha256 "15fbc2482a36782e98e03f1a9e2a0d514db25c4486658c3899a072fb230aad7c"
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

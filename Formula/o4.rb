class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.29/o4-macos-arm64.tar.gz"
  sha256 "08a16e9173d64618f208818d0184b678a827f292aacb30854f70d1ac476a4756"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.29/o4-linux-arm64.tar.gz"
      sha256 "224b6e43ef82daa32df98ef1490ee13a455355a50690eb3b350729d4a89590d9"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.29/o4-linux-x86_64.tar.gz"
      sha256 "ebcced5f73806798ae0b532ffb95d35623364650d39aa6cadc204eb2fdf92e54"
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

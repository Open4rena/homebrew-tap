class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.55/o4-macos-arm64.tar.gz"
  sha256 "6b6ab0c2f84233c46c8ce378979cc41fc2bb75425a3ebecfff8aabb0fc81f836"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.55/o4-linux-arm64.tar.gz"
      sha256 "a074c338045c1e706e5a3f5ef63c5a9c4d0e6cdef31fe898348d481643e1833c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.55/o4-linux-x86_64.tar.gz"
      sha256 "75f88eeb46c584fdf12584c14c579de10760d955a08ef11e979908f29d0f13fe"
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

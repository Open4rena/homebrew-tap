class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.25/o4-macos-arm64.tar.gz"
  sha256 "959569b959a27f2ae73c5de2e78480ee2bf4377c854f12401f208f72cabdfc2d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.25/o4-linux-arm64.tar.gz"
      sha256 "9e06e0e1a1f3ea96b30aa2103a2ea9e8e4e6e1d786e4f5eefabdfac276538af6"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.25/o4-linux-x86_64.tar.gz"
      sha256 "b4d104c1cb92c139995aed4e80340f3034c56c8e85cae7173ba12be6e42a4a1d"
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

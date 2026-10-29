class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.63/o4-macos-arm64.tar.gz"
  sha256 "49eb988963f49c3e4f58532aeca3eeae5986c91e9e07f357ebc70eabfca5ba57"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.63/o4-linux-arm64.tar.gz"
      sha256 "9eac3d3571f829496eecf6feeafb4e204b5ca757e4d85dc9325405498670f478"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.63/o4-linux-x86_64.tar.gz"
      sha256 "76297206e22ac482d968c488b69d98022be6c0850f73e439f39a9d462cdbe75b"
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

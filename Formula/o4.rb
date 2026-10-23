class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.41/o4-macos-arm64.tar.gz"
  sha256 "435049e0155dcd9bc94df8a98b4cc46c588d40f0079238ad934531a642e6b219"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.41/o4-linux-arm64.tar.gz"
      sha256 "383dee1e9d2de4d91828d7e5980363dc0165b10de6c0ee3f95563deb89b121b0"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.41/o4-linux-x86_64.tar.gz"
      sha256 "c7adc6a0e55d5425555ddd1e93c56da0c27e8189ff734197f0ff2281b55f2631"
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

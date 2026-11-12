class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.21/o4-macos-arm64.tar.gz"
  sha256 "921335a8e0cda5653ca8d7c88a826c02e8d0bc97fc80977577a4999996a4548c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.21/o4-linux-arm64.tar.gz"
      sha256 "72364d0aff67ab5d780d7977144c3d83c47d0132eb3b695a23cf2e74a9b81348"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.21/o4-linux-x86_64.tar.gz"
      sha256 "62dec2706bc59935abcf2292163e70f6e01173be49c2a2bae64d9ae8afe21210"
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

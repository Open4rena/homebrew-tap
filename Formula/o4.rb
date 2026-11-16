class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.36/o4-macos-arm64.tar.gz"
  sha256 "84ed71f980ddcabbe22fd9189ad5d89e917b48e0ffb0feb351eba4a9d46e915e"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.36/o4-linux-arm64.tar.gz"
      sha256 "095c4677030b79213abc8b3e8c4784ed4424563dc60b358e24064cd507e7347d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.36/o4-linux-x86_64.tar.gz"
      sha256 "566981a68c8cb1e086f851eee43348979e639b3627cd281b93b0a25f994d321f"
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

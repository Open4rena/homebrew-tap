class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.75/o4-macos-arm64.tar.gz"
  sha256 "281ffebbaac0fa9f4c44dea5568f4f459bc9a5fce4cb5e55f034240bb998b52b"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.75/o4-linux-arm64.tar.gz"
      sha256 "6c195a2c5705ecc96b90366198ea79fe2c8f860b62003d8c0373f2797898dcb9"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.75/o4-linux-x86_64.tar.gz"
      sha256 "2be6033e7d462bf0ae6ce4650d4266cc70e25c659066875017b941cda373ae5f"
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

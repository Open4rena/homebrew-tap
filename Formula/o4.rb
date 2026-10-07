class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.99/o4-macos-arm64.tar.gz"
  sha256 "29f6a3fdbe7ba014cd01a4ac854dbdd66522690c91f537c41519484b58f158f2"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.99/o4-linux-arm64.tar.gz"
      sha256 "0b78f6234490db8079929280dbefc630d2f265568f59e7b6281dcb2c4422a54f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.99/o4-linux-x86_64.tar.gz"
      sha256 "c75c0fe947c43d05116f7fde84292731bb5d7b9069d9d205bd6bd81930314380"
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

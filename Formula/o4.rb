class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.89/o4-macos-arm64.tar.gz"
  sha256 "f63a168d4a3a99224e1956ea3f3fe8733a12c709078ac6e5b062fbff7d797cf0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.89/o4-linux-arm64.tar.gz"
      sha256 "cc1bdb7bbb2cd54945e5592453813471fb5b2d99582a308def78c2dd17f43173"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.89/o4-linux-x86_64.tar.gz"
      sha256 "e765f5b265d6eda5b18e612a97cadb2c5f3b50227c9445786e82602a31580c79"
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

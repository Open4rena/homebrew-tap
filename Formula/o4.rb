class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.78/o4-macos-arm64.tar.gz"
  sha256 "5577ae38ce515de4cb0e081eb5a24a6e57499d5e5a223ba62500104c3250d511"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.78/o4-linux-arm64.tar.gz"
      sha256 "7085091792f7aa05bb37246192063699b387f25daec7117d1408f2c29a451881"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.78/o4-linux-x86_64.tar.gz"
      sha256 "17da3e0e432655c358d4f54e75524c4304efa1b082ef27376a30f000eb04fa5d"
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

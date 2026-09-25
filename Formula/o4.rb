class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.61/o4-macos-arm64.tar.gz"
  sha256 "60254f2d02f847f5939d1c1054909c9391a5954b2930bff70f42683c7a236c52"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.61/o4-linux-arm64.tar.gz"
      sha256 "b4ce412dc7d6329c0c7af54b31446ae22f4709361de769973f2b79d8db955221"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.61/o4-linux-x86_64.tar.gz"
      sha256 "2ca605d41b85937f18c107e012ac3a04b8ff056d5c7f17c1d5319a95e785c01c"
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

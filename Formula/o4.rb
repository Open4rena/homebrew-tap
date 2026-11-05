class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.95/o4-macos-arm64.tar.gz"
  sha256 "f535ef20b4c41450318c3121a8957c1890d2823e8731e007f152880f5e0cae15"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.95/o4-linux-arm64.tar.gz"
      sha256 "db85883b03ad73a0613cfd3e4e2d01db00ee6abbe437163ba954f02a59fe9b9f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.95/o4-linux-x86_64.tar.gz"
      sha256 "885ce917e9de4889532e5a9174e1f707e84a6becaef64b9a02ec00288b06d3a6"
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

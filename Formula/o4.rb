class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.17/o4-macos-arm64.tar.gz"
  sha256 "d2a5e6b27f60460a6124487f830a30beae603c4097abd2804acea53e5b545132"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.17/o4-linux-arm64.tar.gz"
      sha256 "3d6dbde0375dad4d1a86ce22a06cc09d60134eaf0b04806773425f613161b7fb"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.17/o4-linux-x86_64.tar.gz"
      sha256 "9c745afe95c0d3aedd188aaa3df4b95cb1ec9ea7cc05e2e9332631d7d2d4bb15"
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

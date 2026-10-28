class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.51/o4-macos-arm64.tar.gz"
  sha256 "bea177aef54daff35a1f1f8fb0cf79738d116541aa3a3c2557bbc230f9d4aeda"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.51/o4-linux-arm64.tar.gz"
      sha256 "479b44e178ebf9cc726641204ad7b60dba7fb947fdeb4fe39975aaff1054b79d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.51/o4-linux-x86_64.tar.gz"
      sha256 "2230c04b1d6f9a02453c1380df278ef954cd1c7a2160cc60869f3cbcafd5541f"
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

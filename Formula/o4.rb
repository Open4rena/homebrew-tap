class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.37/o4-macos-arm64.tar.gz"
  sha256 "610035ae71ffec99eb7545e7f07eb5b1668e12a05e26ae6b7af3db50a1521877"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.37/o4-linux-arm64.tar.gz"
      sha256 "f5fe6b79a79ec7bbb2e90d7c0f1560f249f839f43d940ddd8d6979f7026cee60"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.37/o4-linux-x86_64.tar.gz"
      sha256 "7d6c176b63e1b0e5838da606e9a9e06083d89c5fb85db7f3f6c39342c6cc624b"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.66/o4-macos-arm64.tar.gz"
  sha256 "46d5580b122b4cf854a107f339f817b7b4b0593a500024cd7b3ac88f43d6c756"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.66/o4-linux-arm64.tar.gz"
      sha256 "4190789580862ab94a2f5ab98978f41e58838d8c2e7b407c73b475d0b023aeea"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.66/o4-linux-x86_64.tar.gz"
      sha256 "5b2e29bb13343ecb3818e1352636391789c4e8607d1630de9f7efba47beb43a5"
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

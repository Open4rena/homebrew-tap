class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.31/o4-macos-arm64.tar.gz"
  sha256 "0b8e2cb6260a2bd19ab170c81a3ad3a987b88a144247544b118578d05f2faa50"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.31/o4-linux-arm64.tar.gz"
      sha256 "df2aa80150de99202d4a5e3479683013e666a6f12abfd13bcc9e58eb87fc852e"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.31/o4-linux-x86_64.tar.gz"
      sha256 "892df175a5676afe220833c8bbe99c4a7dafe2567ae23676605a0b30e5beea10"
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

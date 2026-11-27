class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.63/o4-macos-arm64.tar.gz"
  sha256 "9bbabc9250cc4f20beb63522be50a488d78d88cb19f749e3edf6c28677c14161"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.63/o4-linux-arm64.tar.gz"
      sha256 "e3da36adbf0d7f52b4d54011a3fec869656f4823121bee80b8ca5594e78989a4"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.63/o4-linux-x86_64.tar.gz"
      sha256 "784c42d716fc4d00437e2b2fd093d5de447aa0573ba411c71bb25c3f4efbfd87"
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

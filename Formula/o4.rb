class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.68/o4-macos-arm64.tar.gz"
  sha256 "6fc8cf09a6e91952342e1445e92aba6247be71f126da1e40c0a3c665b9c51de6"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.68/o4-linux-arm64.tar.gz"
      sha256 "de17032f015455dad25e6f03e45a1b30ad6d63287b732b4935e2605937591cd7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.68/o4-linux-x86_64.tar.gz"
      sha256 "474d965ff3de07c1f07c2950cbf0c52d26514ec40b3bb002edec65baf6f4d3ba"
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

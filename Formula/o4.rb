class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.76/o4-macos-arm64.tar.gz"
  sha256 "c90967c3b0ebb6464ea248eeaafd5b0f59593cb7792d6af63340020bbc5e77f3"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.76/o4-linux-arm64.tar.gz"
      sha256 "15a7e8164ec76cae0603c8a9be6a308416a79bbdb4ec94ebe85a565519a43c98"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.76/o4-linux-x86_64.tar.gz"
      sha256 "16efbe9bc8b0cd0c7508ecce93228d030799368458a402a45cd4a3057b30dbc5"
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

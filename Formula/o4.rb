class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.27/o4-macos-arm64.tar.gz"
  sha256 "473b695d132e4eb33e8e06c7a81ad6ece098cb779dedb8985be9bb0e5d8a650e"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.27/o4-linux-arm64.tar.gz"
      sha256 "f94d7ec7ee64574642a9c409d7a06726c0728d8f015979436f4f1da6a24f3b62"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.27/o4-linux-x86_64.tar.gz"
      sha256 "3682ef312c29ecd5c0049e2adda7d5efca4902ae18874b40f86ae30081dc393a"
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

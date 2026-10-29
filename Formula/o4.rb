class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.64/o4-macos-arm64.tar.gz"
  sha256 "96667f6605804f9b469109ad8143524d3d9f0f0ab6a2e831fa1c95fc116dfb0c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.64/o4-linux-arm64.tar.gz"
      sha256 "5682232ec48397f97b61d1e5fffba78ce01bf0a22e6a20d394d44689a93e72b7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.64/o4-linux-x86_64.tar.gz"
      sha256 "e1c509b16fc1113779be464807c4aaf2ef42a1c5f5a1154e22e71f5a69a35ffe"
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

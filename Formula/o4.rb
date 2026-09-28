class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.76/o4-macos-arm64.tar.gz"
  sha256 "bf5d7b0bb9f5054f76e21ba95a293f6d7eedce0603702ec884cd30783610b474"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.76/o4-linux-arm64.tar.gz"
      sha256 "4757b05f2e35ee9a002ee555f581c0318a091d1a4bb2a6768a7fa24b776f3928"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.76/o4-linux-x86_64.tar.gz"
      sha256 "7aeaa2e8e36edefa3c508d8fe89332863fe58c4201fca3f16c2b1836ada69d58"
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

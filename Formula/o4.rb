class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.96/o4-macos-arm64.tar.gz"
  sha256 "a52d038552a2748d40819d3d9c0a224b4358715e05de66575126458eb5dc7aa7"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.96/o4-linux-arm64.tar.gz"
      sha256 "4c43849d46c96ba935ceda0f89e885e99d0be8d553c63d843d4cbde9235a69b8"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.96/o4-linux-x86_64.tar.gz"
      sha256 "9da425c06611fcf6eb8cf8436a3961160841d1d81fdc9fac0a6cd2dbedf69963"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.66/o4-macos-arm64.tar.gz"
  sha256 "cc4802236774a418d756f686f912a8ea1f8425fd3e9bc46494cc02c3032d34ba"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.66/o4-linux-arm64.tar.gz"
      sha256 "d2d9cd374872dda63b8ed08dbcd200e08aa44d3ad60e2cc9e508d3f012b14f3d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.66/o4-linux-x86_64.tar.gz"
      sha256 "c5a77071234eaf65e423bec8d572f75cdf4ff12b30fee4a4b22817c816f1740d"
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

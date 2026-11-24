class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.57/o4-macos-arm64.tar.gz"
  sha256 "2133255ed56d43f139afc3fe626e4c93176ec1f2895b282460a6f19a56e08aab"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.57/o4-linux-arm64.tar.gz"
      sha256 "8f8e5eef5f936fb5cf076251c6dd3dde6d2f54382ca1f44733eed87b00b4124e"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.57/o4-linux-x86_64.tar.gz"
      sha256 "9be2f14ee8b8f332f49daacc9779c130e104147b6e188091199599184b46c6f0"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.81/o4-macos-arm64.tar.gz"
  sha256 "37bb74b9db9bb13fcff517032e4e018f94b50997bf5cbb6f2eb82ab3420ed90f"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.81/o4-linux-arm64.tar.gz"
      sha256 "a057fdf1d6725a1b3d4997ad7e3eaa7bc36b4414b0f54be1cdd28a82e7ce959f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.81/o4-linux-x86_64.tar.gz"
      sha256 "2d157bfc130a4b87da28a927cb96364e48a11f123d4c68e541b7fe019ec66e79"
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

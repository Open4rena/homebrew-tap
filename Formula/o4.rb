class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.53/o4-macos-arm64.tar.gz"
  sha256 "ab80d4e61419bc2d44735f29d36996db30b0905ed90616abd596cbddf1226f22"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.53/o4-linux-arm64.tar.gz"
      sha256 "7827a2f8fe8eead89642e645a1f45b92d5112b3cd9d7e5a11805f2aec267527b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.53/o4-linux-x86_64.tar.gz"
      sha256 "a38f311945aaed0b1bb8a59b375eab7ddb5a0b582a63d1ace905bcf6a83ba304"
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

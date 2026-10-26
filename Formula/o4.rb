class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.45/o4-macos-arm64.tar.gz"
  sha256 "e0fb428857191a198f8063ef379c31f751965260c1c7481dad6333749ff0d3cc"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.45/o4-linux-arm64.tar.gz"
      sha256 "cf982fee4f8925b5e2a084e3d7cd267cb2d65dfb81ff5e19123fd601e48336be"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.45/o4-linux-x86_64.tar.gz"
      sha256 "ac01c82fb16be32e909e9030c5d3b5e9868a75e8623b2f9409b0af6993bb0892"
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

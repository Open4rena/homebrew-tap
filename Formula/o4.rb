class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.5/o4-macos-arm64.tar.gz"
  sha256 "49145f305901e273a0ae20386f0b175d4dfb8945b894232fc85440baaa5f6df1"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.5/o4-linux-arm64.tar.gz"
      sha256 "ef7ed7128f1461ab948583c328655acd2a9000dce512e41be8483f43968757cc"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.5/o4-linux-x86_64.tar.gz"
      sha256 "e1b5d0a7cd6dcb72e361bba2ab18927bdd82294624c27508f1a853450fed7b70"
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

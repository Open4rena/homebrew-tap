class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.26/o4-macos-arm64.tar.gz"
  sha256 "36b0486cff72d2756f3b099c27eb82fc67a583b1f3894636c88ed877d6cf3cae"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.26/o4-linux-arm64.tar.gz"
      sha256 "400b56633b97a4e204d4e860abb36df16ae43d566903e95f717bea33df629585"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.26/o4-linux-x86_64.tar.gz"
      sha256 "36ef65d94dd350d9fc28407262ea3f86f45be5bf3933bbc8cc9725277443f2c7"
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

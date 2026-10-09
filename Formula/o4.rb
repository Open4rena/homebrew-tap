class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.4/o4-macos-arm64.tar.gz"
  sha256 "0242d6fdd4092aa2aef7ae5f583bc7d12081f7856e1f3e36790e6162c00cba20"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.4/o4-linux-arm64.tar.gz"
      sha256 "95f070697972e18d8c91b7206179b83bfd305d9bef0af15cb9a26edb93167275"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.4/o4-linux-x86_64.tar.gz"
      sha256 "cb2552b08754588069730d016ebaa417d06688f51557f242b7a2d05e7bb7d308"
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

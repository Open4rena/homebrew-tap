class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.3/o4-macos-arm64.tar.gz"
  sha256 "a90a747c9bd6ff8cfa21f828df087ac5d8e5604ce09bb3cdc16f6aaf7c683a47"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.3/o4-linux-arm64.tar.gz"
      sha256 "b24806543e9079cda6b97562cc99fdeb289309c0b4e0ab2948e6403f64d94fe3"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.3/o4-linux-x86_64.tar.gz"
      sha256 "7734d0ef92f92d133121bd2220beca20f2c4b51697c8e4f3dc7a2d6550726484"
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

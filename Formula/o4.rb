class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.7/o4-macos-arm64.tar.gz"
  sha256 "e439b5a521f91b105b6c00bb1e090b400f7a28db195dc39158a91c468bea9f67"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.7/o4-linux-arm64.tar.gz"
      sha256 "2ddf2863320d99c442520375ba40e69a48426f419da0f9866372bfafcc12c156"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.7/o4-linux-x86_64.tar.gz"
      sha256 "e08b669b144bb25f456d36eb471cca4b46c1a9b214bd781f0d08a5a529b0ddb7"
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

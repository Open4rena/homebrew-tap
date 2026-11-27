class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.65/o4-macos-arm64.tar.gz"
  sha256 "d0d7c294b34b9f43a1052029df205922afc5b0a2094bc806cb9b9f2e8a5a356a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.65/o4-linux-arm64.tar.gz"
      sha256 "a963e3b5d2e929b06318f8f6bd372ff3c2b2aa314cfb66721f252483816cf5a8"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.65/o4-linux-x86_64.tar.gz"
      sha256 "a5baff983b8a1b80655b57884bea4a83ee1a8a90b2feecfe690ccdb3e0fc6862"
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

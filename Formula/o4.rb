class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.32/o4-macos-arm64.tar.gz"
  sha256 "890841ca17e49fa621bbd9f43cafbde5f16700b2c2becbc0f1420b872b4a8cbf"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.32/o4-linux-arm64.tar.gz"
      sha256 "65f46e8bafb425cd9ab69e011f8ea189c1cf8ad50c554293c250c86b5163b0f6"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.32/o4-linux-x86_64.tar.gz"
      sha256 "83d81c444689ae46ef4a60575f63565ea3010a089f173a12fd001b340a646e29"
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

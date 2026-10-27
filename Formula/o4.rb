class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.46/o4-macos-arm64.tar.gz"
  sha256 "8868347aec92190b62f243a935bfb32ada142e898ea8db534dd1ec33895a0e93"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.46/o4-linux-arm64.tar.gz"
      sha256 "1d69be60b6686e9fd33a667fae3309973725353c1851a26427c602efbe3d3073"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.46/o4-linux-x86_64.tar.gz"
      sha256 "5ae5dbdfd1b4a0feaf997b2771e0579654fa93066af9cd8a471c93c06e37687d"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.6/o4-macos-arm64.tar.gz"
  sha256 "2df2f15c9da2a04ef1bbe07d3517a0a649862bdfb06cacfb176ab9afd74e9450"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.6/o4-linux-arm64.tar.gz"
      sha256 "89e8a7d09c1d2d2a40e7f78779db6e5d468cc162307efbe9c34a0c04c03d2894"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.6/o4-linux-x86_64.tar.gz"
      sha256 "c3fbf8852fc06a9551df909c9873ea8b874d28b132dbd82179c2818429ce5f22"
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

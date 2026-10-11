class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.8/o4-macos-arm64.tar.gz"
  sha256 "8084aedd0a5b929525bb7a8053f0b657d29777a16ebc4c32ced9740ca4a411c4"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.8/o4-linux-arm64.tar.gz"
      sha256 "10c402f6bb81c40aaa5cf9495a3baf27b9bd9300d2b0b18df691a3d0c655005e"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.8/o4-linux-x86_64.tar.gz"
      sha256 "224d2535b7245e14850e3e4e2096f8fdb79a1d9253a10e8a5ffc91ecf4aa4335"
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

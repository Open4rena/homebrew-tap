class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.54/o4-macos-arm64.tar.gz"
  sha256 "ec22d68c1bc998aa4c571bd9a60ea613934326b959aefa458e2ee29b2574a714"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.54/o4-linux-arm64.tar.gz"
      sha256 "ba443d08e26941ca7f00f80b57f403079dd4e5e01c0f126ccd57581e850838b5"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.54/o4-linux-x86_64.tar.gz"
      sha256 "ce6821d6ef337a9126a937369dfd69c08eab955344eeff210d549d85de092e39"
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

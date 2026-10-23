class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.36/o4-macos-arm64.tar.gz"
  sha256 "84be891022d93120f2d745fa54ffee1efe893613095a329e20a4a6b4b63375b2"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.36/o4-linux-arm64.tar.gz"
      sha256 "2ece072846828bf6964b85b9d2ed81e2faa87db0a9acbec3eccede521336c521"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.36/o4-linux-x86_64.tar.gz"
      sha256 "2ed2089dd69b707e0b17cd0c6df8d41899214f33c7feaf1e1ec89a68e165c7a3"
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

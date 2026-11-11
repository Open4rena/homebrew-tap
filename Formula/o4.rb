class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.14/o4-macos-arm64.tar.gz"
  sha256 "bbdd7754d141b6532a9a6ee5b67c0b89a69b1e80e1cf1350ff57974959918c96"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.14/o4-linux-arm64.tar.gz"
      sha256 "8b92b1f1f3b2ee1894ba8eb1845f87a9a0827a319263bea72911565e65c1e631"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.14/o4-linux-x86_64.tar.gz"
      sha256 "b6892b4ee3c5a015e28e0687ddbca1cfe7dbe30bb91b6f5d4fb66bd8bd838c2d"
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

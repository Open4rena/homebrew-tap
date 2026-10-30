class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.67/o4-macos-arm64.tar.gz"
  sha256 "62ef8ba08eeb244a9248466aace6ee0f38a788beb32411a1650cf821f7885529"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.67/o4-linux-arm64.tar.gz"
      sha256 "c6676b3347a2745df0f1e042dcbebaf5c66a76be7ac0a9aee009f86e007c81a3"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.67/o4-linux-x86_64.tar.gz"
      sha256 "9e6c9492511d1598b70f27b20238f2f7e4248dc143044e2b763c9f7319ef97f2"
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

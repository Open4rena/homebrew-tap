class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.83/o4-macos-arm64.tar.gz"
  sha256 "9b75633756d62cb97ae5d5e5d8ed2da92b408499b5a3c9e20e069f2483f15cdd"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.83/o4-linux-arm64.tar.gz"
      sha256 "175201cf227a8c5e760577411ff75595efd2d60b573fdd68a2af671b4875c0f6"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.83/o4-linux-x86_64.tar.gz"
      sha256 "849c5942d0271737b1a2e3a667f5b6a91fcd704412c444c1846dd1ae3310a49c"
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

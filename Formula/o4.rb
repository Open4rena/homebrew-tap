class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.99/o4-macos-arm64.tar.gz"
  sha256 "2d92e9349c357e0b4e39fa91c8faae6f2be502acf66b9ee4f4bfa213700ef0f0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.99/o4-linux-arm64.tar.gz"
      sha256 "95f62719a2d380f193310a2b4693986f4a8537fed543637859e81dbc3127805d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.99/o4-linux-x86_64.tar.gz"
      sha256 "961499861dfd540dc9afe3350264e770edde4ca5be2a9fbafd300d870031a89d"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.21/o4-macos-arm64.tar.gz"
  sha256 "fddb86fed101999fb24f5730dff1eeeabb89f1e9a20e69e9dd5dd8419bf27f8c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.21/o4-linux-arm64.tar.gz"
      sha256 "57841399defee62c17ebcc3bfa63ec0b97f13181cb47b85615eb6cfb079cdbf8"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.21/o4-linux-x86_64.tar.gz"
      sha256 "7beb1381f4c1f54d350abf5b4f305d8179d46c61f0a856dca547cfdd88b0f524"
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

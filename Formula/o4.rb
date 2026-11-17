class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.43/o4-macos-arm64.tar.gz"
  sha256 "95a5bf8de0e649fc8020d6faa93934c79dfac95d46fbe113927165ca4204ffe8"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.43/o4-linux-arm64.tar.gz"
      sha256 "cdec0c4e8d0b5d61dfd4f00b9a494f2bf72c24c68dc0af66cad411746ae93d04"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.43/o4-linux-x86_64.tar.gz"
      sha256 "cfa1db42d5b0fcfe0eaec64d6951f9639a73691929e9223991e56012609c6385"
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

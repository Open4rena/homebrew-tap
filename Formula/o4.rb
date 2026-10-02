class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.84/o4-macos-arm64.tar.gz"
  sha256 "e9b07adae214adcb1dc6644a050b30deec22762dcaeec15611eac7c863f67c4a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.84/o4-linux-arm64.tar.gz"
      sha256 "f201ebfed06750fae23e74b0eefa46c7e770fc3703798175f2b7369a31d8ae18"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.84/o4-linux-x86_64.tar.gz"
      sha256 "42d29fc01372aa87a09f17a5e4093ab63bbbdd7f0485ffacd89f8efd3fa66619"
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

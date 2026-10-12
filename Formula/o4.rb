class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.12/o4-macos-arm64.tar.gz"
  sha256 "d69313cb5e181c9dfec3a174d04e097235bfe7cadfdeca4ec6c4dc4181f99b9e"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.12/o4-linux-arm64.tar.gz"
      sha256 "a8e6eb7f6f256801039cdd44b1afd9052d66580854eaf53f4b3affda5088dc2c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.12/o4-linux-x86_64.tar.gz"
      sha256 "0a6ad53049131e35cd3c6903d27835a03728311d2c75be2aad0d78f0b77b6f1a"
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

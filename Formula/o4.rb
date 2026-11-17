class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.45/o4-macos-arm64.tar.gz"
  sha256 "d36e8d04fcbf9a3330bc8bb40c04d4d8eae662f4ce6eb17737031b4c3e431627"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.45/o4-linux-arm64.tar.gz"
      sha256 "3a44b97ef2de2613b6bb548c645b76591003a7868c54b391b7db00aa752becff"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.45/o4-linux-x86_64.tar.gz"
      sha256 "1fc46ac9e9307c1ddd888ba09458f7de7e109ae946011e8e4a0771c8d0402d6f"
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

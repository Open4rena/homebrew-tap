class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.77/o4-macos-arm64.tar.gz"
  sha256 "137861f1cae7e0c0c912d9a6372644219bbf9c922caae026dd9f709872af8bb0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.77/o4-linux-arm64.tar.gz"
      sha256 "9eb4f18678cc0831dc146116052de9219fc76f0cef0da5acc3ca7ce77484fd5f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.77/o4-linux-x86_64.tar.gz"
      sha256 "f04c98cb00d3b52c8816d34bab9c4f7c3da33e2a9fd8ebfc9b75a4978d003fed"
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

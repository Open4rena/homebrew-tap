class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.8/o4-macos-arm64.tar.gz"
  sha256 "29f8068e355094463687bb6500fb851d00480cd05db2e331528487a155f2c999"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.8/o4-linux-arm64.tar.gz"
      sha256 "dea3d8e479a84582469f5095add7dead1908432e5c8ecd926325be818b097fec"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.8/o4-linux-x86_64.tar.gz"
      sha256 "39f2501a745d8cebc09dfb5f059ca0d01ddcb66eee0223b7a7d37c05cf974248"
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

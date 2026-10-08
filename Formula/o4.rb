class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.0/o4-macos-arm64.tar.gz"
  sha256 "d40474065b4de4af5fc6090c5bcef25c2a13b30f29c571822b457ea3bd194d85"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.0/o4-linux-arm64.tar.gz"
      sha256 "22e95d20db42764c79b2febd00ce394e62fe1fa210cfa02eff89579261ff4919"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.0/o4-linux-x86_64.tar.gz"
      sha256 "7b0def98af7a1e8a1cdb4fa4569f7b5f70275d1de1a264d548ed0134dfa23ea4"
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

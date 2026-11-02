class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.85/o4-macos-arm64.tar.gz"
  sha256 "1c83542fc1f1da73e7b40dcd68a86990ac22119b4d977984521474296341446a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.85/o4-linux-arm64.tar.gz"
      sha256 "e34aafe8be69e2f7064a3bb2fffbb95636a030fff801b6dc24a90e6f954377c8"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.85/o4-linux-x86_64.tar.gz"
      sha256 "6e405260232c384b12fd7764b7affbce93cc4b6da797c266b1adf9b83c5cf43e"
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

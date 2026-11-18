class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.49/o4-macos-arm64.tar.gz"
  sha256 "cc061d64e0cf1540a98d85332dd20c1e755b05e278a5a993fcea1c5651b784d8"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.49/o4-linux-arm64.tar.gz"
      sha256 "02db9fa0908ec56aa605ced4faeee942257e81d2611fc8d2a5070da0333ce9b5"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.49/o4-linux-x86_64.tar.gz"
      sha256 "b54feb4f1a019bb4babef41869f6bdcf1a9abc77eaa2bbbd508859810edc4830"
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

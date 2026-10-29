class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.65/o4-macos-arm64.tar.gz"
  sha256 "f1c3bf5ccae5748d37f0e9941918d109174fcc10613ac3e45131dc76699b5627"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.65/o4-linux-arm64.tar.gz"
      sha256 "153ab096a1df68caff6bf73850a6ecc0e7359fd0f05e4b10f13a4821d67444ce"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.65/o4-linux-x86_64.tar.gz"
      sha256 "adea792971b8a5bde30e2f12b041829a6d30be8d67095ab96829be62da0d9029"
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

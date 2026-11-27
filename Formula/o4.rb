class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.60/o4-macos-arm64.tar.gz"
  sha256 "e8311385ef98d5623dbbf40b4b002c5dbaa4a3169ee2dfac7eb3b5260372246b"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.60/o4-linux-arm64.tar.gz"
      sha256 "282c25361db6b30abae4c8a933e793222a646ac430aad2f0ecb4037cb974c1be"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.60/o4-linux-x86_64.tar.gz"
      sha256 "1946c202c7b7d466dd99a2e85ccc720e2f476a30c8524eb92fa57ae8e9eb23d4"
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

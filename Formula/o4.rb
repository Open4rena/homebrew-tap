class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.38/o4-macos-arm64.tar.gz"
  sha256 "7bcfa043c827d422f30bdf123cf4af4c6d5513badf453f9a596f428792cecd08"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.38/o4-linux-arm64.tar.gz"
      sha256 "855dc759f0d0494a31c12bb51d22299b72eb0ac354810f0bdf6eac1e90357b08"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.38/o4-linux-x86_64.tar.gz"
      sha256 "bc2817360189d303d4384311190e92d007015240ea8f77e4fbb67ba54c73de71"
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

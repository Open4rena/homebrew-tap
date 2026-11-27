class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.64/o4-macos-arm64.tar.gz"
  sha256 "35e3a4f1d9c4853403749b57a4f9e37ae409534aa407f1d405b34cf6b3e1ca44"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.64/o4-linux-arm64.tar.gz"
      sha256 "032985f0a11febaf0c261d364b637f9934709723ddca2965f24c8c451b1d3eab"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.64/o4-linux-x86_64.tar.gz"
      sha256 "5d3847987cec33dcba5e7c2cfe1f6185007a3203292339c556a0852c91da95c9"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.44/o4-macos-arm64.tar.gz"
  sha256 "efa91c9688e6dabf10d146f4bd4bf9e07220ff761d993cb04cd5a97c683b431f"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.44/o4-linux-arm64.tar.gz"
      sha256 "0b13a65cec5ffcfc5dc2d3335e6eb079ae371b7af3cce9b0866086a6018c74ca"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.44/o4-linux-x86_64.tar.gz"
      sha256 "de62d2119b8f528e2fe4da0713d36317b41c1343f7f4021f26696384cc6d1ded"
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

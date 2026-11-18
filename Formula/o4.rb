class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.48/o4-macos-arm64.tar.gz"
  sha256 "60cb58c41a454bed26f7eb15053f8261ed2018992b8ba091714e0d30ed5aee01"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.48/o4-linux-arm64.tar.gz"
      sha256 "5a5cd8ab304ae66b33894bcccfbaf3fc6338411aef26eb096b6e884b67a1c51c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.48/o4-linux-x86_64.tar.gz"
      sha256 "91b2e26f86322d77d34bf4d203d5aafe0af4b0f5d010d60168f3fb21887e141a"
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

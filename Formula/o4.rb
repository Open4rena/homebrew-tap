class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.47/o4-macos-arm64.tar.gz"
  sha256 "2112dc45f801d6b11a001c69b0e2a3cc25cbc44c4383c41752faeaaf81a8fce5"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.47/o4-linux-arm64.tar.gz"
      sha256 "8f9a7e484859f8c56f9eeaf8f17bc13cabc44695e971d5a9dc7e52c2d31c292f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.47/o4-linux-x86_64.tar.gz"
      sha256 "70b6478329de7e74f05466467f2533841bad5f3aaefa06b67cee4bbf6653769a"
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

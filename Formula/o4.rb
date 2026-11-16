class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.40/o4-macos-arm64.tar.gz"
  sha256 "50ffd2dad48f3b50369eaeba1388ac6fcf21595f13617fa899cb353212ef2d3b"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.40/o4-linux-arm64.tar.gz"
      sha256 "25459c5f202310e915ec35d281557cf6dc2de39592dc7678bc28f031a1a63bb7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.40/o4-linux-x86_64.tar.gz"
      sha256 "3b3b7e56d0564f375b00f162ef5f22d362d477c52cb2a9cd32edd9613603cfba"
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

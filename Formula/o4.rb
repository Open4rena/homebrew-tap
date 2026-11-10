class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.4/o4-macos-arm64.tar.gz"
  sha256 "dd8a45172b09f3e054d7b46678510dd0a08d182cf5459e6e65b999ea60caeef1"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.4/o4-linux-arm64.tar.gz"
      sha256 "4760b77a0445ae95e017ce54f9a238826b34c8b875928516f0771289ee7c1acf"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.4/o4-linux-x86_64.tar.gz"
      sha256 "0fa22bf503caf0aeea31a05d4890a9674109fca91f467a95b602641e339d59a1"
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

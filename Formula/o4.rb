class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.37/o4-macos-arm64.tar.gz"
  sha256 "dc88506afcd29e22fce8e39834629f2a697588cf8dfeb29b5e0a41665d54ffd8"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.37/o4-linux-arm64.tar.gz"
      sha256 "26c05de3a336283c45a1ad9a40fb2cc30e095872e65ff6440bafd69fccb27a72"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.37/o4-linux-x86_64.tar.gz"
      sha256 "f72374b82202d0f6688512948ebe1593aa3fadfc0bdaf0194e41f467f0b8cfbe"
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

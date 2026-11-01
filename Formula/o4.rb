class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.80/o4-macos-arm64.tar.gz"
  sha256 "58cdce03a5c7330dbe141810453b3ce0c76728d8774ed9cd90ff099e2ed1b397"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.80/o4-linux-arm64.tar.gz"
      sha256 "82a67768fe6ecf886852b6251deaad9c7b7b47489bf5c065beb31ed04dc4e09b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.80/o4-linux-x86_64.tar.gz"
      sha256 "703328278cb748f9976323d0032c160bf65a7d840096fd688dbf583b06279626"
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

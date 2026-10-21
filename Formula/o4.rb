class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.34/o4-macos-arm64.tar.gz"
  sha256 "24623377349c5f6f573c80694d95ea8aa8570045f62806158169c40976f07131"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.34/o4-linux-arm64.tar.gz"
      sha256 "f2f5f44a0ff558684e89e763c414dd8fa05f7a8a4bc5786a63e50456237251b4"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.34/o4-linux-x86_64.tar.gz"
      sha256 "f9d2c88325533f4457fec130fb4482ae7ae0b2b529bd4e98c241dc9ec617f3a4"
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

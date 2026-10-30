class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.66/o4-macos-arm64.tar.gz"
  sha256 "da4361eb3f362649294aa3af86143fb5f8ae1f07564596c433c2e6383fd60720"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.66/o4-linux-arm64.tar.gz"
      sha256 "257736dbd3395e784ee9ff6e55f9d6ec0d4b33640c002dddb531a8535bc13c03"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.66/o4-linux-x86_64.tar.gz"
      sha256 "89af9aabf5804205f27f0b39f008e2e696c19bbef93b771c7fa155939aeb8d11"
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

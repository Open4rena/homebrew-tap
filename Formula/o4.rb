class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.50/o4-macos-arm64.tar.gz"
  sha256 "388913a6e631f4ae9732c43319571d26be9aed03c938152d9cc9b50a8d59d8ae"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.50/o4-linux-arm64.tar.gz"
      sha256 "0912a49fada4a3722843cefa4ccf15dc31df34a6567397fd7229cf9d99cafa47"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.50/o4-linux-x86_64.tar.gz"
      sha256 "45382235d2a6f4c92bb411564978286e5088fb9b66b2a0ec65f2a89f72aea018"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.79/o4-macos-arm64.tar.gz"
  sha256 "eec344b55a637be2d8021c68fcd9392a5414caf90c17c82eb39147d15fde7b14"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.79/o4-linux-arm64.tar.gz"
      sha256 "2e2569e568e4e08b6c63af839e9a14f983296f8fee3b4c34eaa2606412e673f6"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.79/o4-linux-x86_64.tar.gz"
      sha256 "e801fc4cc484c949a6926afb6efe91b18fcb6fda0f68747cfefb445b17cee40f"
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

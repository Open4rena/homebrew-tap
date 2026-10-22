class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.35/o4-macos-arm64.tar.gz"
  sha256 "1bfdb07d78c2f6f0c2092452e10e013ea87619c8475b4fca492d9eb80dff50b3"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.35/o4-linux-arm64.tar.gz"
      sha256 "150dc53afeb3733c20f80f38177ac3e30db4fb910e580795f7995ad7dbc2a08e"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.35/o4-linux-x86_64.tar.gz"
      sha256 "e74e8b2538e0cb9aff1cccf487825cf9da05bce0e098af13ab4f6ee8c53ad611"
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

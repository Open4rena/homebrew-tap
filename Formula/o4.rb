class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.25/o4-macos-arm64.tar.gz"
  sha256 "bea8234ae995a05fdc9abb6247c0b354be2a98e9d92e4d20cb0ba14e95ece9cd"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.25/o4-linux-arm64.tar.gz"
      sha256 "0bfc627eaa8ffd8209086dfcd01d3b7b14773b15e8ff30760fb1d4e6fa367b3f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.25/o4-linux-x86_64.tar.gz"
      sha256 "3374688dc85b071d1a38be4c3c1b96a63d0a065270ddfb132fecaaa978543952"
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

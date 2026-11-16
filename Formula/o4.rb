class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.38/o4-macos-arm64.tar.gz"
  sha256 "3223cf549266a270436bae93d79c61343334b23511cafd72c308143319e18705"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.38/o4-linux-arm64.tar.gz"
      sha256 "040120058863b4c44292fa4c315332460a32e5e8e187f4de8f0a0b45a37183c1"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.38/o4-linux-x86_64.tar.gz"
      sha256 "125187b524a649875c76e00dfc896009b7b9766d6ec68cd06bf5c797c6577f88"
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

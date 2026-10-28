class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.60/o4-macos-arm64.tar.gz"
  sha256 "a9815e19bc648163e8c5ae5aefba93a9d9c38090a15d7e5fac7ff51d958fb865"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.60/o4-linux-arm64.tar.gz"
      sha256 "a7230d07e105822679c0ff541c18747c1bd7353768c4dc51dd95e98234e1be70"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.60/o4-linux-x86_64.tar.gz"
      sha256 "ab2935575be5b636c6466b57c3cd6330b8f88b026fa0c6cc1b96ee4fba51005d"
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

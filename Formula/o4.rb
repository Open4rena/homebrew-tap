class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.58/o4-macos-arm64.tar.gz"
  sha256 "14cc522327acdfaf814f9924108c0327ffe22c0dd5197559d51a923a0b50b20c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.58/o4-linux-arm64.tar.gz"
      sha256 "a42a1749fcffade5c557f99a419adf5b751856e1a7a53ba8940fbef4dd2ab1e1"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.58/o4-linux-x86_64.tar.gz"
      sha256 "78d4ebf5bd01b00819113ee35b3f1e3b1f804aa3763045102d47ac24ba199a99"
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

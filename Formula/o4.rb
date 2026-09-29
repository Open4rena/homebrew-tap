class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.78/o4-macos-arm64.tar.gz"
  sha256 "b3a55ea406e44149c82ff69343156df8180c07727e54abf6487873b4096d50fa"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.78/o4-linux-arm64.tar.gz"
      sha256 "b0a562136ca8cc5124f88002bb1f75b5e2ef076160df594c9df7ab1c3a6c7ce3"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.78/o4-linux-x86_64.tar.gz"
      sha256 "14f8f299ebe5c248a8d99e2c342e3b161826ab96a1c6b0a4d477a9d2681c51ee"
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

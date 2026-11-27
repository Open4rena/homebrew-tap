class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.68/o4-macos-arm64.tar.gz"
  sha256 "faecce6b2da6700d8bfff19ac038820f67a0556c13bd5b377daedbbb596370f4"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.68/o4-linux-arm64.tar.gz"
      sha256 "40eb6338c97eb8496c0489150aa05a144bdeabd0a5d99dbff05d591f56d76d5b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.68/o4-linux-x86_64.tar.gz"
      sha256 "8f4a32861e405c01e0aa04c9d4572fa3e61a6c359f2896ae9639bb9796b941cb"
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

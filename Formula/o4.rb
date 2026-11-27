class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.58/o4-macos-arm64.tar.gz"
  sha256 "fc6b7c569ae9682fff54f165025864e262e59655066ceeedc3d5c0acb415b23a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.58/o4-linux-arm64.tar.gz"
      sha256 "ad1b2dc7f290033d64251c213a13391bc0de90c93ce90b742f781cad54b43633"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.58/o4-linux-x86_64.tar.gz"
      sha256 "515a5e3ad72a062482539ec0a3e45ce9de910f02fd2e9dcc474deb35f0a86e0d"
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

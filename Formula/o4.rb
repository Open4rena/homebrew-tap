class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.90/o4-macos-arm64.tar.gz"
  sha256 "49b86e915d8387109658ff88aea671b05c9df3898a2f3f0cebbef4a393cd41d4"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.90/o4-linux-arm64.tar.gz"
      sha256 "4059a57a138d07d2d48985a49fbeed86ad54b54ff250a47c557bd35bbb6f0e8d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.90/o4-linux-x86_64.tar.gz"
      sha256 "024e7619f926d8d785e44ab5b44573875a0a85180f176b5bb81643ab7df49bd9"
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

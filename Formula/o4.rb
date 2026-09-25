class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.57/o4-macos-arm64.tar.gz"
  sha256 "500db1dee0aa8c9a194d960c6dccec01f4a03a1bc6e2b09ceb39bbbfe8e5cc20"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.57/o4-linux-arm64.tar.gz"
      sha256 "131b649e2209219c47c52c3f1869ce1833cd9ebe6836c97408cf8e0536614654"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.57/o4-linux-x86_64.tar.gz"
      sha256 "795cafacb2a327402bafd63e465a7acd62cd5c94fc0aee4fe8ede78fbb932d14"
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

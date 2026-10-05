class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.92/o4-macos-arm64.tar.gz"
  sha256 "fc7ffe946855845581488f895c4f6307135b94f1082bc37b17c17165bceb2b7f"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.92/o4-linux-arm64.tar.gz"
      sha256 "7d3b0d9fb8205207c15104f009f1ef39212ed5aa67fe19bff2ee0b5e49ec2e55"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.92/o4-linux-x86_64.tar.gz"
      sha256 "5a553043a2e56f59aed3dec1491e4716ff61895ab0e25bbbd70d466dcca5d912"
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

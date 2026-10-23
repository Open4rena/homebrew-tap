class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.42/o4-macos-arm64.tar.gz"
  sha256 "a6f11a2fd346890341d1a688cbfbc4c112268a458a93b5d6a2be244d14705e6a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.42/o4-linux-arm64.tar.gz"
      sha256 "48e51999ac57f3e72a1e2b6eebb6b3eaf1dc3e9560f0655ceb9f575fc59c6257"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.42/o4-linux-x86_64.tar.gz"
      sha256 "266944deb743c873c73c4b8c47640f929bdc9a1f70a1acf92aaeb3aad85d8635"
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

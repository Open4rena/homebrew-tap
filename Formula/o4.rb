class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.30/o4-macos-arm64.tar.gz"
  sha256 "25218fcc3aeb538d6e802df6ed83f69621aff883254fdb404cc82ce7b3bf3b94"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.30/o4-linux-arm64.tar.gz"
      sha256 "e67e7214e9a3d810758fd0448267d26fa658766e0ab74b08c63ff9cc0bd911a2"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.30/o4-linux-x86_64.tar.gz"
      sha256 "0d23f9aa1f738c867b9bd550b06e172d854fb8afaf0d4528cf45922a4a2e42e6"
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

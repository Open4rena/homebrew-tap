class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.98/o4-macos-arm64.tar.gz"
  sha256 "51af092e6b666bc85324956146306b4bc765f093df65c81957d8c8507e4a1fa1"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.98/o4-linux-arm64.tar.gz"
      sha256 "ef69a1092ad6d8b24e0660ff770b9f55f02b5107c849caa58ffccaa05c116f4a"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.98/o4-linux-x86_64.tar.gz"
      sha256 "8ead1e42e08f1de612d48238a97125e991b64fce77e74f7a9d1e249118f4657b"
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

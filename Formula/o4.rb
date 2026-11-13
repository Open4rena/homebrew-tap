class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.26/o4-macos-arm64.tar.gz"
  sha256 "70ab0673f37a78e4d0fb8d53e31069642172ce5146921c75a46a95fa204d9720"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.26/o4-linux-arm64.tar.gz"
      sha256 "04757b259230762ccdf42a288f214aad98891d2d532fe4e1f1352f2610cee6c5"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.26/o4-linux-x86_64.tar.gz"
      sha256 "f2693cdc77668bd38585d247a43904fde2b7ff892b04c63d2e3bba7478604748"
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

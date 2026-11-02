class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.84/o4-macos-arm64.tar.gz"
  sha256 "76bb68c18b65d52905bb159fd2e8104b85cd2d08bee2f02aed1d99f1692209c0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.84/o4-linux-arm64.tar.gz"
      sha256 "c286f6cbcae2622fa55b18172f4b7e068b8f9995ae5a511e62448f7c71cd125f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.84/o4-linux-x86_64.tar.gz"
      sha256 "061278a70e625f5f529d233cf3068b5e04e9516b97b098d716a042ba9ee7c809"
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

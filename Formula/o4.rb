class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.33/o4-macos-arm64.tar.gz"
  sha256 "e218d07691b40220c7e817be13fd67a8a62c2fe314c1dd89f1e74631eac9fb09"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.33/o4-linux-arm64.tar.gz"
      sha256 "a44f632ce2ffaba5c7aab800ba9f8a7bcc264dd10c6ecec0ed00686526028dc7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.33/o4-linux-x86_64.tar.gz"
      sha256 "f551724f4ebf17f3b0003f27e865e851eca4296df0f78040dd40fc48b7c52218"
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

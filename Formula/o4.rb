class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.50/o4-macos-arm64.tar.gz"
  sha256 "d07f30dc346dd73cd0852ef0dfeefa2a5c30f5e4942ad250e58f1222039c7b1d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.50/o4-linux-arm64.tar.gz"
      sha256 "3c7f790524cfa2f9f1f1b999bc81545655eef663b4db93e027f902f238ce2c0a"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.50/o4-linux-x86_64.tar.gz"
      sha256 "d8912bfbe49a70ea82a9903bbecf06209e03030fb76e2a82026bb99081076cac"
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

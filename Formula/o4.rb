class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.80/o4-macos-arm64.tar.gz"
  sha256 "912a53d1270f379181645befa2b7213799fbcca36c2108f6a133527ad1f64bec"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.80/o4-linux-arm64.tar.gz"
      sha256 "4a6b41ae28c39d5a5a0bcdaaf7594a16c1955e24a02d2d891e2ff706ee1879eb"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.80/o4-linux-x86_64.tar.gz"
      sha256 "e62c764c28751454b3f85fd115087aea70476393929d398b37823c63e0b04f89"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.69/o4-macos-arm64.tar.gz"
  sha256 "c3a98a7434717e6231ce556e1553176d9f359a22839552c75400e5f32d9579af"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.69/o4-linux-arm64.tar.gz"
      sha256 "d9f817ec7e1f548e7e9d1359fcc69929abf40ae68c4d71b46be48aa0113239fc"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.69/o4-linux-x86_64.tar.gz"
      sha256 "edad2f44db68e7bd9e9a94124dc37b44b1b304806f9e6f967629318e7c63876f"
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

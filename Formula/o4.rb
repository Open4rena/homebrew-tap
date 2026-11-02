class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.88/o4-macos-arm64.tar.gz"
  sha256 "e4d80f998f5f204e427a40f916b2d47cd57f6c18758844e48c278e7ef5566e3d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.88/o4-linux-arm64.tar.gz"
      sha256 "3a14c4bfa8705100dd3cc8540821b7453293fb80035fa0bfb245190d043bae7c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.88/o4-linux-x86_64.tar.gz"
      sha256 "09c43616f918f5a9bdc996601471097bf5879587487819f0bfa34b3855b552fa"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.74/o4-macos-arm64.tar.gz"
  sha256 "8e7b320bef483584162d1f7dda0ead9cbcc910ebde85dcd9fc0260bde59baff6"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.74/o4-linux-arm64.tar.gz"
      sha256 "b82b93e837b1240711182b06ba55bbfde00b713ff38c265716a1e36803e38f67"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.74/o4-linux-x86_64.tar.gz"
      sha256 "113b85b893c71340aa3b9ba27f3d939ffc9f0ceecc2014a210a6921bd501e6ff"
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

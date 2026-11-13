class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.31/o4-macos-arm64.tar.gz"
  sha256 "41d6900ce5c6b3c7c33a512fb17bb5c4a84b8ee410ea6deb8310516b5af4be43"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.31/o4-linux-arm64.tar.gz"
      sha256 "c22531e0826d479a8634dc0cd149d50a253391fd3445a7d7f13fd95ffb617c18"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.31/o4-linux-x86_64.tar.gz"
      sha256 "a24d631197b36ee9455c94396ccf43843501836e1ae56372e3cea1f5a3c0d01f"
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

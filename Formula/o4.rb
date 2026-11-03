class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.94/o4-macos-arm64.tar.gz"
  sha256 "35b22afd4713f4717f77e641258646b92aedcfb8faabbdc70c177dc5ee96e40e"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.94/o4-linux-arm64.tar.gz"
      sha256 "ac362ffe554c91cf494e666ad5514b15210cb0e7efa717f809a3a9971e8f2625"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.94/o4-linux-x86_64.tar.gz"
      sha256 "ad66d45a7f838fcf07bd8cc606ed4f7937bf709adfd7675ad176d700e9551de6"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.23/o4-macos-arm64.tar.gz"
  sha256 "5065bbc50f3c6055d8729ec0a82c4067804c03f9a1b535d62bac65dc57f527ae"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.23/o4-linux-arm64.tar.gz"
      sha256 "5fe88e1720bd5fb48ce0f9de36368ed545d8631a96ab05709ce07a4c12233f69"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.23/o4-linux-x86_64.tar.gz"
      sha256 "9567aada58bed71a671122a092f22b96a629e505a4bd55608ad5a9916e948d7e"
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

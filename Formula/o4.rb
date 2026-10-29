class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.62/o4-macos-arm64.tar.gz"
  sha256 "784c2e6aa772c22b9286439b190c9953de9de3855ef12ba0f71af1de61bb0fb3"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.62/o4-linux-arm64.tar.gz"
      sha256 "882c6264f4160fb9337b9143b70bccea9dc888f024016b27f07cd1c5671a0963"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.62/o4-linux-x86_64.tar.gz"
      sha256 "a138201451fb65b1634dda6289edc87a8c3dd9dcd0972d7b456d12458601f835"
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

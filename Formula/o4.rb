class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.52/o4-macos-arm64.tar.gz"
  sha256 "438ec91ff8f712d704b4768cbfaf1b93f3a6c2413d91733416bbfebf56e5c2f5"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.52/o4-linux-arm64.tar.gz"
      sha256 "ed91c901fb5ee4801ebfe02b4650f6cf9d3f1fb6f31995e5e44ae3585aa97aee"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.52/o4-linux-x86_64.tar.gz"
      sha256 "cc87ff8877b28b59470d98113cc5cbbca8f75cad90620cc9212b998f8fa5d470"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.61/o4-macos-arm64.tar.gz"
  sha256 "7d5a37f3b20c310354eeec1a0f401caad1542e15445d224964b811bb671fd445"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.61/o4-linux-arm64.tar.gz"
      sha256 "ca7ffca8bd06208c5ee38465c7aecfbeb6c489464216dd5140146eec35be420d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.61/o4-linux-x86_64.tar.gz"
      sha256 "b191a595b96fb3a0f8f9f38d36a42bc057835ee566a6277c0e8722db34e01a66"
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

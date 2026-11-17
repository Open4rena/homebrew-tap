class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.41/o4-macos-arm64.tar.gz"
  sha256 "718540fb50b184850b9facfe5f24fdb6b5e2a9fe55dcb9c74df4972b933d2c6e"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.41/o4-linux-arm64.tar.gz"
      sha256 "ebfb6d218660685b90e40ce74d645a0715f275e208bb9c07e2113d013fd04ba9"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.41/o4-linux-x86_64.tar.gz"
      sha256 "3d10149df5d669d2325619480850d6ff08db8d8dfbd15d3d359e62bf0ceb7ea3"
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

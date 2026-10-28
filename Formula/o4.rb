class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.57/o4-macos-arm64.tar.gz"
  sha256 "73dd5f787be93edde643fe601f07a4d9b9c7bd62a25c1b432560d87abda1ac6f"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.57/o4-linux-arm64.tar.gz"
      sha256 "26e4773720926bc701dc1d7cd32b1c71a954627b6bbd831ef28c7c837b59027a"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.57/o4-linux-x86_64.tar.gz"
      sha256 "e8b513ca947e69313a0fa5914fdc4b32fd3eb5d87622316a0d69c8ecb25fa78c"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.9/o4-macos-arm64.tar.gz"
  sha256 "6c19c39430a700a9f154d4f006f848179604d150a31222e9e9f31a0398df898d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.9/o4-linux-arm64.tar.gz"
      sha256 "8c5c7aadfdae5b3b87c9646c9a93261c379efd59cfd26ae19308f83218e0e022"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.9/o4-linux-x86_64.tar.gz"
      sha256 "3a087065f27f9efdfb85fc362f85539d9201297e0b775e1dc2e2c1cc1a8313ea"
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

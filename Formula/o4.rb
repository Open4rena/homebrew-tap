class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.72/o4-macos-arm64.tar.gz"
  sha256 "d8471893b2d014a9f90e4b1648dbb28d4623e323751732e27f9bf602e5c454b0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.72/o4-linux-arm64.tar.gz"
      sha256 "1a13c4117e96d9d6c879b04c7948304a4a7781f0a33e5efe1d34c28da072310b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.72/o4-linux-x86_64.tar.gz"
      sha256 "517ac4b227e2f0eaac6c5e3a2e7da69bad6dfb819615403c980834bf9fc41f9a"
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

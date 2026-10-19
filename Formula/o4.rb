class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.32/o4-macos-arm64.tar.gz"
  sha256 "86a04dd1d59a6920a2faff3e7a53f2edf2e23720f452a4f0f0b774d45967c00c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.32/o4-linux-arm64.tar.gz"
      sha256 "1ea3855cd549800cae3883b8353c00da1eaaf34f6d5d3d1757f19ee3796b47f2"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.32/o4-linux-x86_64.tar.gz"
      sha256 "2245462f62b257de19e2350fe3272174fb8951d2fb7900d9146d4a1edd7c0d90"
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

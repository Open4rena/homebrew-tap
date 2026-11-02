class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.86/o4-macos-arm64.tar.gz"
  sha256 "7d7062fb5eb71a4fb77006bba424d6e853a9b9faf7003e7562ad2ce88bac1ae7"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.86/o4-linux-arm64.tar.gz"
      sha256 "ec272069c90c9da7de623f653dd5a781d4331b19699a48935bc51bc0b924aa5c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.86/o4-linux-x86_64.tar.gz"
      sha256 "e4345f5f460557403d8007974e56e13c631ddf5e9d1a2960d0886c22166a9f7b"
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

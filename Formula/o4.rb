class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.7/o4-macos-arm64.tar.gz"
  sha256 "7276c9165952cee677c2d7e321e380059b4b8ca53a06e9cc2651e28f687fbdbe"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.7/o4-linux-arm64.tar.gz"
      sha256 "763ecc8bd0650476f91ae940ce9dd9cece98fb7371f6c91c785aa130ff0b39d0"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.7/o4-linux-x86_64.tar.gz"
      sha256 "c5ace70e3206490d0b48421f27e4462f07e188119648a819fec30022f8d91eba"
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

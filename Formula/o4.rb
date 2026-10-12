class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.9/o4-macos-arm64.tar.gz"
  sha256 "9cb73e21f55792f1dc4f9fc36a8f780b8bcc2301c2b53fa102f8e24e1c5db05d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.9/o4-linux-arm64.tar.gz"
      sha256 "57ecdb1b3f2861a95329b0b54fd3becb450315d755edec29d713c22aa6af951b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.9/o4-linux-x86_64.tar.gz"
      sha256 "ea2079f87ce580301f7116a6d470a3dccc7a0bd8a16e3b0c3223cc11c2c77a9a"
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

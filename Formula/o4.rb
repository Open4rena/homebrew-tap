class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.82/o4-macos-arm64.tar.gz"
  sha256 "d3e963b9e18b60063025e95c7bec3294ff22e31a98178255ea1728766f1e706a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.82/o4-linux-arm64.tar.gz"
      sha256 "e87633abe6ad6a3f2dafffd8f633fd60d46aa3a7950a068d5ff89a71b7adb15d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.82/o4-linux-x86_64.tar.gz"
      sha256 "490aaf34ac6e76a714bcbe7597ca0353fdd69b5879944997d9795bcc768be1ee"
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

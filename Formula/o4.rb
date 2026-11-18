class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.47/o4-macos-arm64.tar.gz"
  sha256 "0fff64a83074f453b53b99aa795234534b3fce85d111796239225aa0e9219b37"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.47/o4-linux-arm64.tar.gz"
      sha256 "09b87495841251c6b85420026298d1a27a70f04ab617d719c3e9a61e12ca2444"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.47/o4-linux-x86_64.tar.gz"
      sha256 "b2cb3be199de436b03d3d2695fe2887822cad0e5768efdf452cd2855c9d6e6be"
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

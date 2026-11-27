class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.67/o4-macos-arm64.tar.gz"
  sha256 "12886d2a365a3b5fb49222c9331bc3fa6889e6bdf783663fec308efe162a2ab5"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.67/o4-linux-arm64.tar.gz"
      sha256 "34216096ac7054d19cbb332d14b0dea692925096226849f173105991f4ea33db"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.67/o4-linux-x86_64.tar.gz"
      sha256 "732ebdd785ebc5b090461a405d24904c3227ab62db309aa541e66c8cf067fb1a"
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

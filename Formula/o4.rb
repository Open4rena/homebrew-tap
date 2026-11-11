class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.11/o4-macos-arm64.tar.gz"
  sha256 "de0658311375302d8993297248cf7c50a8712aa219aeb8f8491e586984facbf9"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.11/o4-linux-arm64.tar.gz"
      sha256 "bb8df0b4d8615f76de249d626997db8179d76a114b9813800cf59013e7f2f04b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.11/o4-linux-x86_64.tar.gz"
      sha256 "cc38d0369122195b308fc7c017b08e3e3f93d538ef2741d66f670f97c5a92d68"
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

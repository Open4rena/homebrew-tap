class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.81/o4-macos-arm64.tar.gz"
  sha256 "ee6b81de76b9fefc7726cd0a1de17d8f3f29027d867644e53586ed903f09ac7a"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.81/o4-linux-arm64.tar.gz"
      sha256 "0786b25f6a6c6b4a1ea909f8d71407656d58ba12295358c1f6cb858344f44370"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.81/o4-linux-x86_64.tar.gz"
      sha256 "773d53e42d1122846392a5b923658b57712ef9bb056702c6eaf0fe748bddf39a"
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

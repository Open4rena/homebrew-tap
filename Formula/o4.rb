class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.13/o4-macos-arm64.tar.gz"
  sha256 "4856bd06453165756c35ba6fd610449b4beae9079a61755e5bed5140003d0553"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.13/o4-linux-arm64.tar.gz"
      sha256 "4e5de2ee3e336779f0881104a25326a0d1d87019c5e97395f694835355ddd786"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.13/o4-linux-x86_64.tar.gz"
      sha256 "fb93a9a2508f0de9d74030645d4ed139d98227d28e184b6e4783e92c3d627c54"
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

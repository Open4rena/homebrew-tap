class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.56/o4-macos-arm64.tar.gz"
  sha256 "e2a7dff67aeb54ee7ce9b02db204866b1bd26235cd149957de7181a015841b8d"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.56/o4-linux-arm64.tar.gz"
      sha256 "ea69ac97bdee75c010eb705d710369a23725ed7f3df8c517c325b154859d1b3b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.56/o4-linux-x86_64.tar.gz"
      sha256 "4ea4ac47024635beb1f581bc02bd5ffaa7b59cb1b27b3b076598e5f885effb26"
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

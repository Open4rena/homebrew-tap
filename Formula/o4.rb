class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.67/o4-macos-arm64.tar.gz"
  sha256 "fc71e60f6ee2994a3c5066dbacf215114221dda180092d5a6fc0d3632202b4f7"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.67/o4-linux-arm64.tar.gz"
      sha256 "91782b2be9b7887b3d4a8091f70de9be3e03890b3e554446444dbacf7858ccdb"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.67/o4-linux-x86_64.tar.gz"
      sha256 "b559b5a57e92323e872b4fe61ff253bdc16207936e4ffdcf800f35daba4fc9b3"
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

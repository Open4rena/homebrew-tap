class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.89/o4-macos-arm64.tar.gz"
  sha256 "cd113ee55b676ee85daf4a908a40056ff84d280364fed542f5cd3a9de918cb08"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.89/o4-linux-arm64.tar.gz"
      sha256 "a2d4e0871ba3d12c8f3fc3ff5a544b0d0e82905cd7b7cdb9068fd0e57a0cca85"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.89/o4-linux-x86_64.tar.gz"
      sha256 "d99eb7804dade1ba99fd63915733d7bbf34f38292d55d37d1113032ff7304410"
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

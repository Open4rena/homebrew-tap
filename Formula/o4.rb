class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.16/o4-macos-arm64.tar.gz"
  sha256 "98556ace6b13f829a4a653a26c080c84f84b257dc323f791406dc89dad14f9c4"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.16/o4-linux-arm64.tar.gz"
      sha256 "ac58492502e760c0225a9ce948c291503a9a208d92e0f9b6211f2056c511f49c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.16/o4-linux-x86_64.tar.gz"
      sha256 "e02d7f94a89c13aea8adb7acda31fcc61099ba7a1c8b9268f1fb2234ef3be995"
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

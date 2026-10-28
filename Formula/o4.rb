class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.59/o4-macos-arm64.tar.gz"
  sha256 "4d5df3bf6e05a69768f1c6a58753319d016b73ccd208350a076f9a849fe06637"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.59/o4-linux-arm64.tar.gz"
      sha256 "9a9f3def74b90623659f490a11654b7a65915eda8a9f6309d41a97d28c507bd1"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.59/o4-linux-x86_64.tar.gz"
      sha256 "7d75eb939a2785ac6b577a8c8bb2403c63e2c52c565456696fa133951641ced3"
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

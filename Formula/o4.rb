class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.91/o4-macos-arm64.tar.gz"
  sha256 "86e935e18b7241c4e3477f9e8d05634e4b1eef44f509470d9229eac91746ef19"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.91/o4-linux-arm64.tar.gz"
      sha256 "0babf2c9e952eb89c323212495539277314ffd56f694f827b7251126602df299"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.91/o4-linux-x86_64.tar.gz"
      sha256 "7723789ac3da1ca57020fdafc3e540ab29bf834cb9941a44ce2d6637aac50bc5"
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

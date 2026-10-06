class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.97/o4-macos-arm64.tar.gz"
  sha256 "dac047ee7dc0e769d54dfb72b0022a876fee7c504f7aa401981b602c0b94826c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.97/o4-linux-arm64.tar.gz"
      sha256 "d01aa7df64f474c1f01954c6cc2e896c06b04ee132243eb61b365bf3b750556b"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.97/o4-linux-x86_64.tar.gz"
      sha256 "b3db7e7af64de9b08e28ae96eb029b1b8340c2d88ada0f0fac8585c7bd7b1386"
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

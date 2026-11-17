class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.42/o4-macos-arm64.tar.gz"
  sha256 "5a17eeb015cb994fa8f1b8405b3a888f8cb6407de05da7b41ddb79734120c8b0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.42/o4-linux-arm64.tar.gz"
      sha256 "569e748f1614d031bc395da983863a05a15e6bedae3d9d049639d5cd9a845ec4"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.42/o4-linux-x86_64.tar.gz"
      sha256 "9eca5e44972e6ad2aa511ec2b9d3d8f66bf1e651d5f5b2a02e06db84ec77932d"
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

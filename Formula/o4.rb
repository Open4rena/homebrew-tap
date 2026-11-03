class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.93/o4-macos-arm64.tar.gz"
  sha256 "2a0dcf57d9e5319eb2a1201875a8052453ede68effb6a48ef090f5de9b0287ac"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.93/o4-linux-arm64.tar.gz"
      sha256 "43dba9a35bfd7a9c40442b22cd714a6cc9c22b53912a5eeeab09e3818ab10668"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.93/o4-linux-x86_64.tar.gz"
      sha256 "943dd8710e10473d57e50a3dc6951f039487bcc3b6bc0bd9cd341ccfb69a8ff7"
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

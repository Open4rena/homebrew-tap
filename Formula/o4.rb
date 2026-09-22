class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.46/o4-macos-arm64.tar.gz"
      sha256 "348f9344cfff640e658afeaad23aaeac63ac575d4a58f26fe56f73bb2256b248"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.46/o4-macos-x86_64.tar.gz"
      sha256 "697452d7aa3cabc1453f2fcb495e37345f677f95615bf2ff12237f527bcdff3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.46/o4-linux-arm64.tar.gz"
      sha256 "098f7871b89840aab5e914b722af7c6dd7e89b69c81c9c0c00f2e85fe17a801f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.46/o4-linux-x86_64.tar.gz"
      sha256 "63c39a97a0831d722385944dc177c3f646ce0718cd3ffab445bc4442d46d0188"
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

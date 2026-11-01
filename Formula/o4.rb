class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.82/o4-macos-arm64.tar.gz"
  sha256 "a201c3006fa04aaa6d3bca75bf3e9d17d5d1784f42f19449612248700755d416"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.82/o4-linux-arm64.tar.gz"
      sha256 "d4d673ff3446ea4f3534073a859b1b6cbf0791e81db018c86a37f0fc0eca0714"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.82/o4-linux-x86_64.tar.gz"
      sha256 "0b8116b22492fc95dda3d94d6817acc9ee418b3f154bbd68b513c27507835e43"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.61/o4-macos-arm64.tar.gz"
  sha256 "8acae213658de9c7f0fb21dc123e6b972810a4b91194daf197c6986e7dc46fac"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.61/o4-linux-arm64.tar.gz"
      sha256 "554b39d6627221732d694f67c4d7a89e61821f292183e85b34a68307f7685dbb"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.61/o4-linux-x86_64.tar.gz"
      sha256 "4aa55ad7edd40b051faaf901d1aa48b0b706b47621184a53dcdbefc8d9f2f825"
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

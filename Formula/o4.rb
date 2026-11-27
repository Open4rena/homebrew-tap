class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.59/o4-macos-arm64.tar.gz"
  sha256 "04df26f49908be84df449b5a417d850fef42577c60bb3b1fc03625c3e5236792"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.59/o4-linux-arm64.tar.gz"
      sha256 "d8d03575cb13112bedeaa4ed71620587bd55d73176d5f5f1bed016213bbf5412"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.59/o4-linux-x86_64.tar.gz"
      sha256 "f3af7e633cbc9bc72daab4f021f0d3bba4b216a8b5a6ff5e0561af85b047bd8c"
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

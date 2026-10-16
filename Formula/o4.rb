class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.28/o4-macos-arm64.tar.gz"
  sha256 "61ea65c60ac1b73d7e58dea892397baf2754729895b4bde9303ff2cf557e0fe7"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.28/o4-linux-arm64.tar.gz"
      sha256 "7ebd237c9df9ccae0d70a009731d01bbd427a78acd1923bc80ee496a2ba24ff7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.28/o4-linux-x86_64.tar.gz"
      sha256 "4c74443df96087e4df29b75d58ec19995564c8bca16020aba3cad407b2443890"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.22/o4-macos-arm64.tar.gz"
  sha256 "b2f795989dc55a438ebbdee30faa09920ae9f4f93e7caffe126ff34d4c5b3224"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.22/o4-linux-arm64.tar.gz"
      sha256 "4e0fe5840f05c6632063a55d8c490234ced79dd75b06ae083d25b81d5016a573"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.22/o4-linux-x86_64.tar.gz"
      sha256 "196baf35a0d8672a5be533826712ae7b8a885e65da1bec8bded374ebf567e3f6"
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

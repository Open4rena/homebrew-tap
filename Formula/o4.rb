class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.70/o4-macos-arm64.tar.gz"
  sha256 "a9c48e93ca6d54b33f2f99009c0ffcea127a074d94c0d56e38693a08bcd18553"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.70/o4-linux-arm64.tar.gz"
      sha256 "c52183fd1927f26548388716c49692aceb5b6cbc6ac3987667b158b45793d998"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.70/o4-linux-x86_64.tar.gz"
      sha256 "094759b448e12fd6ce074b716a7bba071a6318f752b4d1f979a6daab8b079c42"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.74/o4-macos-arm64.tar.gz"
  sha256 "57f9312f2d0dd97e6a6ce19d7d084da87c03624ae47fb490d1c392c959d5890c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.74/o4-linux-arm64.tar.gz"
      sha256 "d2f2232bcb8780818bfe4b85acc22edc516b538891bdaaa1bb8f2fe2a24e00b1"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.74/o4-linux-x86_64.tar.gz"
      sha256 "650e3922e9035694773c225d7f47ffb9024437b5cc3f6296c53a212dda7a52ee"
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

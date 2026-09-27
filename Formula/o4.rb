class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.71/o4-macos-arm64.tar.gz"
  sha256 "7ba1c129a0e7a86b66f9f991483721777f514fc25a4b19a912252b0ab849b631"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.71/o4-linux-arm64.tar.gz"
      sha256 "33c2082defdd69e3a9940eb55ffa6f429bd408e0158fd0bae06a86b791b55111"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.71/o4-linux-x86_64.tar.gz"
      sha256 "741eae401240acd44f763849a4735c46e499187aa55093d2e22e49fe69d8177b"
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

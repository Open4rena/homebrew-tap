class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.46/o4-macos-arm64.tar.gz"
  sha256 "219756750868a85f118f3efd7c2c94c1093451cafd2e2a9bc225a409d70589f0"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.46/o4-linux-arm64.tar.gz"
      sha256 "9537beb30df34f86d9613adef836ca8f746b0075830426062d17423f6f74ed98"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.46/o4-linux-x86_64.tar.gz"
      sha256 "9d66378db5059b1f40de560a122ec48771111b6623fd0c4f531ddf676175c229"
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

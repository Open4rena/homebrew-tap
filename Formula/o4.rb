class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.39/o4-macos-arm64.tar.gz"
  sha256 "3fb0367fec98b71693883a5712e67c0dbf272d059b58c0852fbc24daa6da84a5"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.39/o4-linux-arm64.tar.gz"
      sha256 "e7d356f9734f48fdf51060d9bfd1f7aef6a903d7b71031bab9c881fbe035ff09"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.39/o4-linux-x86_64.tar.gz"
      sha256 "b7395f06e87658b5cc52a9fdb7633c9c610d0f3f894d3bda9baf6b3bbd7bde68"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.62/o4-macos-arm64.tar.gz"
  sha256 "bbec2b40de9ee0d88034cf53f07f69f42ec147895c67b8726bf204af797f1ee4"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.62/o4-linux-arm64.tar.gz"
      sha256 "7d19b5f504fb22a44ed88ba4e3e8dc5f751889c011f9752491994fa66496e518"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.62/o4-linux-x86_64.tar.gz"
      sha256 "1cdad9d437f4b48c3316799abdd46d744c8c9eba12b4899cf1d12b39861b57e1"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.49/o4-macos-arm64.tar.gz"
  sha256 "b1bf7499fc4afd2cde76b559cffe2c5cabeadb0be351e4ca70d58db63f2ff2e8"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.49/o4-linux-arm64.tar.gz"
      sha256 "a89a21599ffbc19b9bdfe9c6c7e50a0687bba74c8408de0f63ff884f16e0d305"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.49/o4-linux-x86_64.tar.gz"
      sha256 "0fbb9f630670de3942eab985a59652ba824225d87b154486746f78912c5d009d"
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

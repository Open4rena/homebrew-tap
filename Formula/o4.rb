class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.44/o4-macos-arm64.tar.gz"
  sha256 "31e1a122a1f2c8532b2a863981453fe50c7edf72932bf709c0ab2842452817da"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.44/o4-linux-arm64.tar.gz"
      sha256 "e0155875af4840753f4c9f9807ed71cc22f765af85ea504b72c78a1b8f1d5566"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.44/o4-linux-x86_64.tar.gz"
      sha256 "d73ca8f6f926cc9bc34605c2a1461dfddc660489183748108c36cf7a6afb7914"
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

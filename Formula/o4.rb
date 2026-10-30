class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.73/o4-macos-arm64.tar.gz"
  sha256 "38c9b1ae8a388701ccaab373b91fac7ec4bc577d9c46198f1e1ab13765a3ce63"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.73/o4-linux-arm64.tar.gz"
      sha256 "97062a09f90080575465d3537021f6270d330dbc1ab090687f7bfa6939d319be"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.73/o4-linux-x86_64.tar.gz"
      sha256 "d17a827b37fee54d4572be7b0aa457c781fce35cd00cc96025996e5f25d1560b"
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

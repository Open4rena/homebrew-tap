class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.18/o4-macos-arm64.tar.gz"
  sha256 "7383fce96781c8b8f056cc770ba3cd44e3823790e17c9b9b8bafd40217955cb7"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.18/o4-linux-arm64.tar.gz"
      sha256 "f1e507e03710725ccbe193e0b7ab9c171013aeb79b380d735133882d263863d1"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.18/o4-linux-x86_64.tar.gz"
      sha256 "25de8d7fe8f6a2b0d794b3793a965aeb16e30bfd15ee346663ae2612c29721e5"
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

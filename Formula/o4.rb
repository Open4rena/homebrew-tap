class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.40/o4-macos-arm64.tar.gz"
  sha256 "6122a0d6a37a9bd40671ba912a104b28d7c4e2c122b4fb55d63da8d8195275df"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.40/o4-linux-arm64.tar.gz"
      sha256 "520b70c8ff8461dbe2eb251e751c5fc625309bc924063a8746fe40975d895ea7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.3.40/o4-linux-x86_64.tar.gz"
      sha256 "91c88df67c34cc26c546e272cd5ac0eaff0d60ec59f16c457a39d3affa8aa6c5"
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

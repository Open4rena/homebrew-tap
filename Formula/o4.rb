class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  # macOS releases ship for Apple Silicon only. Homebrew needs a URL on
  # every platform it loads the formula on, so the Apple Silicon build is
  # the unconditional default and each Linux platform overrides it; the
  # arch requirement is what stops an install on an Intel Mac.
  url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.33/o4-macos-arm64.tar.gz"
  sha256 "b5d74672a3a645d571cbf001c6af5c70815b73385451effa22bcbb1a12c7139c"
  # Proprietary: distributed under the EULA in the releases repository.
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.33/o4-linux-arm64.tar.gz"
      sha256 "f3df8c808ee3a3c57ab2dd9e6113eeb5b7317ffc6e1269d331d97d604b78b99f"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.4.33/o4-linux-x86_64.tar.gz"
      sha256 "00c920a01b03dd5432b2f4146fd6c813c2f90bfd69ee0e13f1adb053d15efe70"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.50/o4-macos-arm64.tar.gz"
      sha256 "9da3711e20e863fd86b648e4b9f6dbcc5589a20a330495efdaee139b3e59d998"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.50/o4-macos-x86_64.tar.gz"
      sha256 "0e9cf9359973289e8e112df7ac4d47614fcda3d21d3a6901c10167a508710fe6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.50/o4-linux-arm64.tar.gz"
      sha256 "b389a9784fefded34b872b841ea9b019fd66a6922d67007f4d09a24b7c67d98e"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.50/o4-linux-x86_64.tar.gz"
      sha256 "f77ca585d680b90cabe5a48b7b3d3355dd156e42bceed3cfb0046fbb9cf74494"
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

class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.49/o4-macos-arm64.tar.gz"
      sha256 "8a7460b2d5e41e492487df7253b7b5fdbd4afc2f1651ebc5a42c52a28fb28489"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.49/o4-macos-x86_64.tar.gz"
      sha256 "48aa10fec7f6fd45e15098e1f9fc76aa438bbcfa6af160af94336ab9660db70d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.49/o4-linux-arm64.tar.gz"
      sha256 "138acf7148b009805e44316fb8bf576edaa8fea148caeab09783701506ed9190"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.49/o4-linux-x86_64.tar.gz"
      sha256 "e9757391549070edf75b34350b4b57c2ce789a87b81877e437055b307606877d"
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

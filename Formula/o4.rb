class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.34/o4-macos-arm64.tar.gz"
      sha256 "890d3a51f73d29819cc4fa8c71f2da88f8b16f74bdcb6db31c5fc6763295bbe8"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.34/o4-macos-x86_64.tar.gz"
      sha256 "c658a2d9e4edd4aa7c13ac8e538ad92cbb07510a552417339be4b9b1e2640291"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.34/o4-linux-arm64.tar.gz"
      sha256 "e90533a4d42612c08a8d681d9c42fc73cf9b4b6560cd9429762d28832589c9f7"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.34/o4-linux-x86_64.tar.gz"
      sha256 "4a2d49bc049c3b0a85b5bf3ec4d25df2dad0ea0e8c7db5a025200e112f6ab092"
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

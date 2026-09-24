class O4 < Formula
  desc "Multi-provider agentic coding assistant for the terminal"
  homepage "https://github.com/Open4rena/o4-releases"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.54/o4-macos-arm64.tar.gz"
      sha256 "1d5ceb4188766aacf6e1da59a9dc96c41f7ad5e2d14e03daf772822e6059ba8d"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.54/o4-macos-x86_64.tar.gz"
      sha256 "cb67e826db7c9ccb9ebc23acfb2f49350292d117724db618006424cd0aee9f8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.54/o4-linux-arm64.tar.gz"
      sha256 "dee962d955f9692a75232c232a083d6c32597f43b0cb65c3adf9376aaef10a8c"
    end

    on_intel do
      url "https://github.com/Open4rena/o4-releases/releases/download/v0.2.54/o4-linux-x86_64.tar.gz"
      sha256 "2429daa6dbbfd1302e5dd75af17c2ae2780824e614444b5e20a92f45a8b01852"
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

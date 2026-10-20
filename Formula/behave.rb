class Behave < Formula
  desc "Record how a CLI behaves, then prove a rewrite behaves the same"
  homepage "https://github.com/emirmrkaljevic/behave"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.6/behave_0.1.6_darwin_arm64.tar.gz"
      sha256 "9913f6bef3a6517be127f9d688d5e55a87a16f264230013f89d92ed43d8eb0a5"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.6/behave_0.1.6_darwin_amd64.tar.gz"
      sha256 "f85d332a3474b3feccc4dce1d28e1d290bfea99a53dafdb1b306fe97362468f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.6/behave_0.1.6_linux_arm64.tar.gz"
      sha256 "5f485f032e46d4d1730f69cffea09e4c6efe5e120a12881f2c5dee28ad4c303a"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.6/behave_0.1.6_linux_amd64.tar.gz"
      sha256 "b4ae9b27456271df15cc903850f11cfa048a0e0f871d98baa25fd1a71517cd92"
    end
  end

  def install
    bin.install "behave"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/behave version")
    system bin/"behave", "probe", "tr", "--out", testpath/"spec", "--max", "40"
    assert_match " 0 failed", shell_output("#{bin}/behave run #{testpath}/spec")
  end
end

class Behave < Formula
  desc "Record how a CLI behaves, then prove a rewrite behaves the same"
  homepage "https://github.com/emirmrkaljevic/behave"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.7/behave_0.1.7_darwin_arm64.tar.gz"
      sha256 "b8b5ff67ec6b1f190193ea434be07c12d1fb791c588427f31c3b482b575f16a6"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.7/behave_0.1.7_darwin_amd64.tar.gz"
      sha256 "1212d9f41b5007274155fe48373186cc80192dcec081b0b0f24f47133dcba283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.7/behave_0.1.7_linux_arm64.tar.gz"
      sha256 "20b8bad7c81f4c80f6067b257a6a1a6c914106225cac7dcebad56687aea25333"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.7/behave_0.1.7_linux_amd64.tar.gz"
      sha256 "141777bca27ec82f65a1b1a5f614802b01fed70cd272d5db6a3cd93d26517417"
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

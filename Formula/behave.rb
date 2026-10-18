class Behave < Formula
  desc "Record how a CLI behaves, then prove a rewrite behaves the same"
  homepage "https://github.com/emirmrkaljevic/behave"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.5/behave_0.1.5_darwin_arm64.tar.gz"
      sha256 "55f0adc947fbe396f113550548b06f23e87cdc49e91aa4d6348b3c5bc1481dce"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.5/behave_0.1.5_darwin_amd64.tar.gz"
      sha256 "6784d3156fb432a593cdb68153f73056ec8245a6528c568461fac271ae786cb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.5/behave_0.1.5_linux_arm64.tar.gz"
      sha256 "e578b46254739bcaacf4625476b80cc0721ac03452aa3407c3306819c0b2f5a9"
    end
    on_intel do
      url "https://github.com/emirmrkaljevic/behave/releases/download/v0.1.5/behave_0.1.5_linux_amd64.tar.gz"
      sha256 "5c3acdd17d664a8fd117fa4b9dd4e4b23161827008e7aba4b4ab8ae1a3883709"
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

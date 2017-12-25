class Coin < Formula
  desc "Simple CLI app to get cryptocurrency price information"
  homepage "https://github.com/tombell/coin"
  url "https://s3.amazonaws.com/coin-builds/coin-v0.0.1.zip"
  sha256 "18cd7b3b6b4ff51d8e597ec5910acebd595543a0b29f15c1895835d0f0c9fa56"

  def install
    bin.install "coin"
  end

  test do
    system "#{bin}/coin", "-h"
  end
end

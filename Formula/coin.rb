class Coin < Formula
  desc "Command-line app to get cryptocurrency price info"
  homepage "https://github.com/tombell/coin"

  url "https://s3.amazonaws.com/coin-builds/coin-v0.0.4.zip"
  sha256 "196cea76f3bab2291174a8f125fcea153a7b438fe9f2c1b4b3bf1b5d8422bf34"

  def install
    bin.install "coin"
  end

  test do
    system "#{bin}/coin", "-h"
  end
end

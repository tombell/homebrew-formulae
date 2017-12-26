class Coin < Formula
  desc "Simple CLI app to get cryptocurrency price information"
  homepage "https://github.com/tombell/coin"
  url "https://s3.amazonaws.com/coin-builds/coin-v0.0.2.zip"
  sha256 "12751400238addf591188d35ce016bdb249e8de8cb8a8e464d9ae82d8f034830"

  def install
    bin.install "coin"
  end

  test do
    system "#{bin}/coin", "-h"
  end
end

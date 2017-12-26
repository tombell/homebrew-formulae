class Coin < Formula
  desc "Simple CLI app to get cryptocurrency price information"
  homepage "https://github.com/tombell/coin"
  url "https://s3.amazonaws.com/coin-builds/coin-v0.0.3.zip"
  sha256 "53d0a1d8c57cf9b7ce354343ce79ff14516bf66dd8c5c904f552fafec5ff97eb"

  def install
    bin.install "coin"
  end

  test do
    system "#{bin}/coin", "-h"
  end
end

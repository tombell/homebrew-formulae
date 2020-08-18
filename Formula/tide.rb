class Tide < Formula
  desc "A minimal Transmission CLI client"
  homepage "https://github.com/salman-abedin/tide"
  head "https://github.com/salman-abedin/tide.git"

  def install
    system "make"
    bin.install "src/tide"
  end

  test do
    # how to test this? :joy:
  end
end

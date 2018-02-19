class Releasekit < Formula
  desc "Create or update GitHub releases based on closed issues and/or merged pull requests"
  homepage "https://github.com/tombell/releasekit"

  url "https://s3.amazonaws.com/releasekit-builds/releasekit-v0.1.1.zip"
  sha256 "d697bed000182b6a1ac9d7474d494b9ffed84339c6f07c9b99f4bfaf673a3b7b"

  def install
    bin.install "releasekit"
  end

  test do
    system "#{bin}/releasekit", "-h"
  end
end

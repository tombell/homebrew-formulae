class Prettytest < Formula
  desc "Adds color to the output of `go test` on macOS or Linux systems"
  homepage "https://github.com/tombell/prettytest"

  url "https://s3.amazonaws.com/prettytest-builds/prettytest-v0.0.1.zip"
  sha256 "87ee737129100425d21793bb3ae4f8cc873c4fa759f908796c6327fd33cb6e59"

  def install
    bin.install "prettytest"
  end

  test do
    system "#{bin}/prettytest", "-h"
  end
end

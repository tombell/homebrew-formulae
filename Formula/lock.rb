class Lock < Formula
  desc "Command-line app to quickly lock macOS"
  homepage "https://github.com/tombell/lock"
  head "https://github.com/tombell/lock.git"

  def install
    system "make", "build"
    prefix.install_metafiles
  end

  test do
    # how to test this? :joy:
  end
end

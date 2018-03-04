class Lock < Formula
  desc "Command-line app to quickly lock macOS"
  homepage "https://github.com/tombell/lock"
  head "https://github.com/tombell/lock.git"

  def install
    system "mkdir", "-p", "bin"
    system "clang", "-framework", "login", "-F", "/System/Library/PrivateFrameworks", "--output=lock", "lock.c"
    bin.install "lock"
  end

  test do
    # how to test this? :joy:
  end
end

class Lock < Formula
  desc "Command-line app to quickly lock macOS"
  homepage "https://github.com/tombell/lock"
  url "https://github.com/tombell/lock/archive/v1.0.0.tar.gz"
  sha256 "5c8a518829a40193c805ff85f3c799f8755e2f81c7a00b9ab32698c801897a17"
  head "https://github.com/tombell/lock.git"

  def install
    system "clang", "-framework", "login", "-F", "/System/Library/PrivateFrameworks", "--output=lock", "lock.c"
    bin.install "lock"
  end

  test do
    # how to test this? :joy:
  end
end

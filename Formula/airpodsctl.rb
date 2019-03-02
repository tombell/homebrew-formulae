class Airpodsctl < Formula
  desc "Connect/Disconnect your AirPods from the command-line"
  homepage "https://github.com/tombell/airpodsctl"
  url "https://github.com/tombell/airpodsctl/archive/v1.0.0.tar.gz"
  sha256 "533f3590ff7e11117889532ad981de510b8026458df068c62ec3c2778070296a"
  head "https://github.com/tombell/airpodsctl.git"

  def install
    system "swiftc", "airpodsctl.swift"
    bin.install "airpodsctl"
  end

  test do
    # how to test this? :joy:
  end
end

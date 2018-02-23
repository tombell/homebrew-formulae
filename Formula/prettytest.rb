class Prettytest < Formula
  desc "Pipe output of `go test` to add color"
  homepage "https://github.com/tombell/prettytest"
  url "https://github.com/tombell/prettytest/archive/v0.0.2.tar.gz"
  sha256 "c14dcc718f683b7f4b61b1025ef11fc05aa1b0ceccfc07909ed9465a5cacbed0"
  head "https://github.com/tombell/prettytest.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/prettytest").install buildpath.children
    cd "src/github.com/tombell/prettytest" do
      system "go", "build", "-o", bin/"prettytest", "./cmd/prettytest"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/prettytest"
  end
end

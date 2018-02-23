class Releasekit < Formula
  desc "Create GitHub releases from closed issues and pull requests"
  homepage "https://github.com/tombell/releasekit"
  url "https://github.com/tombell/releasekit/archive/v0.1.1.tar.gz"
  sha256 "02fff2cdb0f6f37f749133797d8dfc27a36cf4d65458258ef56a7079ac975f3f"
  head "https://github.com/tombell/releasekit.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/releasekit").install buildpath.children
    cd "src/github.com/tombell/releasekit" do
      system "go", "build", "-o", bin/"releasekit", "./cmd/releasekit"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/releasekit"
  end
end

class Lodge < Formula
  desc "Command-line app to embed binary file data into Go files"
  homepage "https://github.com/tombell/lodge"
  url "https://github.com/tombell/lodge.git",
    :tag => "v0.0.1",
    :revision => "d8ad98e6d557c282eb16c8782239cb0aedf69b9a"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/lodge").install buildpath.children
    cd "src/github.com/tombell/lodge" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build",
             "-o", bin/"lodge",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/lodge/cmd/lodge"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/lodge"
  end
end

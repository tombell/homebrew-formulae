class Lodge < Formula
  desc "Command-line app to embed binary file data into Go files"
  homepage "https://github.com/tombell/lodge"
  url "https://github.com/tombell/lodge.git",
    :tag => "v0.1.1",
    :revision => "7f8a6041bd9571f431dcab13b71f023e62093953"

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

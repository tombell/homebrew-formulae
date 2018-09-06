class Lodge < Formula
  desc "Command-line app to rename MP3 files based on ID3 tags"
  homepage "https://github.com/tombell/moniker"
  url "https://github.com/tombell/moniker.git",
    :tag => "TODO",
    :revision => "TODO"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/moniker").install buildpath.children
    cd "src/github.com/tombell/moniker" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build", "-mod=vendor",
             "-o", bin/"moniker",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/moniker/cmd/moniker"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/moniker"
  end
end

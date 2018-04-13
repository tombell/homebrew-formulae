class Releasekit < Formula
  desc "Create GitHub releases from closed issues and pull requests"
  homepage "https://github.com/tombell/releasekit"
  url "https://github.com/tombell/releasekit.git",
    :tag => "v0.1.2",
    :revision => "e6b49811a7a5670e3d48e1a5a6946f119355b610"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/releasekit").install buildpath.children
    cd "src/github.com/tombell/releasekit" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build",
             "-o", bin/"releasekit",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/releasekit/cmd/releasekit"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/releasekit"
  end
end

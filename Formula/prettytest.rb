class Prettytest < Formula
  desc "Pipe output of `go test` to add color"
  homepage "https://github.com/tombell/prettytest"
  url "https://github.com/tombell/prettytest.git",
    :tag => "v0.0.7",
    :revision => "636f491a447dfc23af60c8b98a832b8f974ed146"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/prettytest").install buildpath.children
    cd "src/github.com/tombell/prettytest" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build",
             "-o", bin/"prettytest",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/prettytest/cmd/prettytest"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/prettytest"
  end
end

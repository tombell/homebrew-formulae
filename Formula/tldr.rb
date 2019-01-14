class Tldr < Formula
  desc "Simplified and community-driven man pages"
  homepage "https://github.com/tombell/tldr"
  url "https://github.com/tombell/tldr.git",
    :tag => "v0.1.3",
    :revision => "cb8370915eddfe02e518f7f4aea1161a8553c6b8"

  depends_on "go" => :build
  depends_on "lodge" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/tldr").install buildpath.children
    cd "src/github.com/tombell/tldr" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "make", "generate"
      system "go", "build",
             "-o", bin/"tldr",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/tldr/cmd/tldr"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/tldr"
  end
end

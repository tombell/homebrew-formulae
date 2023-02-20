class Tm < Formula
  desc "An opinionated manager for tmux sessions"
  homepage "https://github.com/tombell/tm"
  url "https://github.com/tombell/tm.git", tag: "v0.0.1", revision: "2f6ea950aa2a4151b2b8f54fbbf6d90a513c1f5b"
  head "https://github.com/tombell/tm.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/tm").install buildpath.children
    cd "src/github.com/tombell/tm" do
      system "go", "build",
             "-o", bin/"tm",
             "github.com/tombell/tm/cmd/tm"
      prefix.install_metafiles
    end
  end
end


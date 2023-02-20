class Tm < Formula
  desc "An opinionated manager for tmux sessions"
  homepage "https://github.com/tombell/tm"
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


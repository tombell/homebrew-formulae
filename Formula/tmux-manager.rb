class TmuxManager < Formula
  desc "Opinionated tmux session manager"
  homepage "https://github.com/tombell/tm"
  url "https://github.com/tombell/tm.git", tag: "v0.0.4", revision: "a7f31efe246c587d1dc845fff726167095fd3b6d"
  head "https://github.com/tombell/tm.git", branch: "main"

  depends_on "go" => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system "go", "build",
           "-o", bin/"tm",
           "-ldflags", "-X main.Version=#{version} -X main.Commit=#{commit}",
           "./cmd/tm"

    prefix.install_metafiles
  end

  test do
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    assert_match "tm #{version} (#{commit})", shell_output("#{bin}/tm --version")
  end
end

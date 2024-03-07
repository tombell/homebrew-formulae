class Tm < Formula
  desc "Opinionated tmux session manager"
  homepage "https://github.com/tombell/tm"

  url "https://github.com/tombell/tm.git", tag: "v0.0.3", revision: "1c7c37204e33f70d88df01f53860c1693f9b22b6"
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

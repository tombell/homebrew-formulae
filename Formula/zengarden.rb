class Zengarden < Formula
  desc "Super minimal and opinionated static site generator"
  homepage "https://github.com/tombell/zengarden"
  url "https://github.com/tombell/zengarden.git",
    :tag => "v0.0.8",
    :revision => "6e1092c9b167e28fddd9de0a7f65ea04ad326189"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    (buildpath/"src/github.com/tombell/zengarden").install buildpath.children
    cd "src/github.com/tombell/zengarden" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build", "-mod=vendor",
             "-o", bin/"zg",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/zengarden/cmd/zg"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/zg"
  end
end

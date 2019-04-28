class Zengarden < Formula
  desc "Super minimal and opinionated static site generator"
  homepage "https://github.com/tombell/zengarden"
  url "https://github.com/tombell/zengarden.git",
    :tag => "v0.0.3",
    :revision => "baf2bc65b21120103bf598876aa0a08b43f2403a"

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

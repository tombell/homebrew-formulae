class Coin < Formula
  desc "Command-line app to get cryptocurrency price info"
  homepage "https://github.com/tombell/coin"
  url "https://github.com/tombell/coin.git",
    :tag => "v0.1.2",
    :revision => "0a4c0e867f7b52468dec0f68c9b11fb7e72a2203"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/coin").install buildpath.children
    cd "src/github.com/tombell/coin" do
      commit = Utils.popen_read("git rev-parse --short HEAD").chomp
      ldflags = [
        "-X main.Version=#{version}",
        "-X main.Commit=#{commit}",
      ]
      system "go", "build",
             "-o", bin/"coin",
             "-ldflags", ldflags.join(" "),
             "github.com/tombell/coin/cmd/coin"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/coin"
  end
end

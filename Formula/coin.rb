class Coin < Formula
  desc "Command-line app to get cryptocurrency price info"
  homepage "https://github.com/tombell/coin"
  url "https://github.com/tombell/coin.git",
    :tag => "v0.0.6",
    :revision => "e42cdb1cf741ce372b7d107f3a9063f54da33327"

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

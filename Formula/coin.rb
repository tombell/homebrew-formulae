class Coin < Formula
  desc "Command-line app to get cryptocurrency price info"
  homepage "https://github.com/tombell/coin"
  url "https://github.com/tombell/coin/archive/v0.0.5.tar.gz"
  sha256 "3b615c910df539da92b87ac5801aaa5cc252adc1bd15cf661c33238170f6c73a"
  head "https://github.com/tombell/coin.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/coin").install buildpath.children
    cd "src/github.com/tombell/coin" do
      system "go", "build", "-o", bin/"coin", "./cmd/coin"
      prefix.install_metafiles
    end
  end

  test do
    # TODO
    # system "#{bin}/coin"
  end
end

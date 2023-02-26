class Ensong < Formula
  desc "Watch directories for mixes and tracklists to upload"
  homepage "https://github.com/tombell/ensong"
  url "https://github.com/tombell/ensong.git", tag: "v0.1.2", revision: "ee50a8f8b784adc35de08d005472c0eb5c727c43"
  head "https://github.com/tombell/ensong.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/ensong").install buildpath.children
    cd "src/github.com/tombell/ensong" do
      commit = `git rev-parse HEAD | cut -c -8`.chomp

      system "go", "build",
             "-o", bin/"ensong",
             "-ldflags", "-X main.Version=#{version} -X main.Commit=#{commit}",
             "github.com/tombell/ensong/cmd/ensong"

      prefix.install_metafiles
    end
  end

  service do
    run opt_bin/"ensong"
    keep_alive true
    log_path var/"log/ensong.log"
    error_log_path var/"log/ensong.log"
    environment_variables PATH: std_service_path_env
  end
end

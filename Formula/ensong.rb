class Ensong < Formula
  desc "Watch directories for mixes and tracklists to upload"
  homepage "https://github.com/tombell/ensong"
  url "https://github.com/tombell/ensong.git", tag: "v0.4.0", revision: "28b16cb6ec8343603fff66d3b6a083b4167685b1"
  head "https://github.com/tombell/ensong.git", branch: "main"

  depends_on "go" => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system "go", "build",
           "-o", bin/"ensong",
           "-ldflags", "-X main.Version=#{version} -X main.Commit=#{commit}",
           "./cmd/ensong"

    prefix.install_metafiles
  end

  service do
    run opt_bin/"ensong"
    keep_alive true
    log_path var/"log/ensong.log"
    error_log_path var/"log/ensong.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match "Usage of ensong:", shell_output("#{bin}/ensong -h")
  end
end

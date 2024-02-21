class Migrate < Formula
  desc "Migrate is a database migration tool for PostgreSQL and SQLite"
  homepage "https://github.com/tombell/migrate"
  url "https://github.com/tombell/migrate.git", tag: "v0.0.1-alpha.1", revision: "b9a0c0cf0bb522b690eb24fdd4bc658d6cb3836e"
  head "https://github.com/tombell/migrate.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/migrate").install buildpath.children
    cd "src/github.com/tombell/migrate" do
      commit = `git rev-parse HEAD | cut -c -8`.chomp

      system "go", "build",
             "-o", bin/"migrate",
            "-ldflags", "-X github.com/tombell/migrate/cmd/migrate/commands.Version=#{version} -X github.com/tombell/migrate/cmd/migrate/commands.Commit=#{commit}",
             "github.com/tombell/migrate/cmd/migrate"

      prefix.install_metafiles
    end
  end

  test do
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    assert_match "migrate version #{version} (#{commit})", shell_output("#{bin}/migrate --version")
  end
end

class Migrate < Formula
  desc "Database migration tool for PostgreSQL and SQLite"
  homepage "https://github.com/tombell/migrate"

  url "https://github.com/tombell/migrate.git", tag: "v0.0.1-alpha.1", revision: "b9a0c0cf0bb522b690eb24fdd4bc658d6cb3836e"
  head "https://github.com/tombell/migrate.git", branch: "main"

  depends_on "go" => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp
    cmds_package = "github.com/tombell/migrate/cmd/migrate/commands"

    system "go", "build",
           "-o", bin/"migrate",
           "-ldflags", "-X #{cmds_package}.Version=#{version} -X #{cmds_package}.Commit=#{commit}",
           "./cmd/migrate"

    prefix.install_metafiles
  end

  test do
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    assert_match "migrate version #{version} (#{commit})", shell_output("#{bin}/migrate --version")
  end
end

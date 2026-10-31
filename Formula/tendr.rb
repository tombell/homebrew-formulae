class Tendr < Formula
  desc 'Declaratively manage local Herdr projects'
  homepage 'https://github.com/tombell/tendr'

  head 'https://github.com/tombell/tendr.git', branch: 'main'

  depends_on 'go' => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system 'go', 'build',
           '-o', bin / 'tendr',
           '-ldflags', "-X main.Version=#{version} -X main.Commit=#{commit}",
           './cmd/tendr'

    prefix.install_metafiles
  end

  test do
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    assert_match "tendr #{version} (#{commit})", shell_output("#{bin}/tendr --version")
  end
end

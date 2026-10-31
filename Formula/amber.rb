class Amber < Formula
  desc 'Start and stop Rex terminal sessions from YAML configs'
  homepage 'https://github.com/tombell/amber'

  url 'https://github.com/tombell/amber/archive/refs/tags/v0.0.1.tar.gz'
  sha256 'd3a29dc3dfe86c6eb6f4bdd5725e32cf9377ca8ca327563e62aea58210a53c5c'
  head 'https://github.com/tombell/amber.git', branch: 'main'

  depends_on 'go' => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system 'go', 'build',
           '-o', bin / 'amber',
           '-ldflags', "-X main.Version=#{version} -X main.Commit=#{commit}",
           './cmd/amber'

    prefix.install_metafiles
  end

  test do
    assert_match "amber #{version} (", shell_output("#{bin}/amber --version")
  end
end

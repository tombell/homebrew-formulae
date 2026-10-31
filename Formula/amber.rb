class Amber < Formula
  desc 'Start and stop Rex terminal sessions from YAML configs'
  homepage 'https://github.com/tombell/amber'

  url 'https://github.com/tombell/amber.git',
      tag:      'v0.0.1',
      revision: '496cf91e766f48ab5eaa98aac32ed7b3c9a8fc07'
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
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    assert_match "amber #{version} (#{commit})", shell_output("#{bin}/amber --version")
  end
end

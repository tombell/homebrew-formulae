class Amber < Formula
  desc 'Start and stop Rex terminal sessions from YAML configs'
  homepage 'https://github.com/tombell/amber'

  url 'https://github.com/tombell/amber.git',
      tag: 'v0.0.2',
      revision: '9e9cc7314735f4a23f78b2b16e33f4c365acde06'
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
    assert_match(/^amber #{Regexp.escape(version.to_s)} \(\h{8}\)$/, shell_output("#{bin}/amber --version"))
  end
end

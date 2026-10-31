class Amber < Formula
  desc 'Start and stop Rex terminal sessions from YAML configs'
  homepage 'https://github.com/tombell/amber'

  url 'https://github.com/tombell/amber.git',
      tag:      'v0.0.1',
      revision: '496cf91e766f48ab5eaa98aac32ed7b3c9a8fc07'
  head 'https://github.com/tombell/amber.git', branch: 'main'

  bottle do
    root_url 'https://github.com/tombell/amber/releases/download/v0.0.1'
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: '469e7d62896d6c0db0311e63797d8d67f30d920fcf371f02853d6ae538cdc9f3'
  end

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

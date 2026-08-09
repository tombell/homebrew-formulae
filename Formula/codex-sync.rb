class CodexSync < Formula
  desc 'Safely synchronize ChatGPT desktop preferences between Macs'
  homepage 'https://github.com/tombell/codex-sync'

  head 'https://github.com/tombell/codex-sync.git', branch: 'main'

  depends_on 'go' => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system 'go', 'build',
           '-o', bin / 'codex-sync',
           '-ldflags', "-X main.Version=#{version} -X main.Commit=#{commit}",
           './cmd/codex-sync'

    prefix.install_metafiles
  end

  test do
    assert_match "codex-sync #{version} (", shell_output("#{bin}/codex-sync --version")
  end
end

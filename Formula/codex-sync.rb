class CodexSync < Formula
  desc 'Safely synchronize ChatGPT desktop preferences between Macs'
  homepage 'https://github.com/tombell/codex-sync'

  head 'https://github.com/tombell/codex-sync.git', branch: 'main'

  depends_on 'go' => :build

  def install
    system 'go', 'build',
           '-o', bin / 'codex-sync',
           './cmd/codex-sync'

    prefix.install_metafiles
  end

  test do
    assert_match 'codex-sync pull pyra', shell_output("#{bin}/codex-sync --help")
  end
end

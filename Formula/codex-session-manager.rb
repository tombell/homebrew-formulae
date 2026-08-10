class CodexSessionManager < Formula
  desc 'Inspect, back up, and delete Codex sessions'
  homepage 'https://github.com/tombell/codex-session-manager'

  head 'https://github.com/tombell/codex-session-manager.git', branch: 'main'

  depends_on 'go' => :build

  def install
    system 'go', 'build', '-o', bin / 'csm', './cmd/csm'

    prefix.install_metafiles
  end

  test do
    assert_match 'Usage of', shell_output("#{bin}/csm --help 2>&1")
  end
end

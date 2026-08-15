class XcodeSync < Formula
  desc 'Safely synchronize Xcode preferences between Macs'
  homepage 'https://github.com/tombell/xcode-sync'

  head 'https://github.com/tombell/xcode-sync.git', branch: 'main'

  depends_on 'go' => :build

  def install
    commit = `git rev-parse HEAD | cut -c -8`.chomp

    system 'go', 'build',
           '-o', bin / 'xcode-sync',
           '-ldflags', "-X main.Version=#{version} -X main.Commit=#{commit}",
           './cmd/xcode-sync'

    prefix.install_metafiles
  end

  test do
    assert_match "xcode-sync #{version} (", shell_output("#{bin}/xcode-sync --version")
  end
end

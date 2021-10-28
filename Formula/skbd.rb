class Skbd < Formula
  desc "Stark Keybind Daemon"
  homepage "https://github.com/tombell/skbd"
  url "https://github.com/tombell/skbd.git", tag: "v0.0.7", revision: "3ac0a5932bcaa9d6081909136cafb429ef2224c7"
  head "https://github.com/tombell/skbd.git", branch: "main"

  bottle do
    root_url "https://skbd-builds.s3.amazonaws.com"
    sha256 cellar: :any_skip_relocation, monterey: "1336bd6ad4adac92d40fb0a496c9de16505eea3ce022cb2828f5b07142674a5c"
  end

  depends_on xcode: :build
  depends_on macos: :monterey

  def install
    (var/"log/skbd").mkpath
    system "make", "package"
    bin.install "#{buildpath}/.build/release/skbd"
  end

  plist_options manual: "skbd"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/skbd</string>
        </array>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PATH</key>
          <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/local/bin:/usr/sbin:/sbin</string>
        </dict>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{var}/log/skbd/skbd.out.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/skbd/skbd.err.log</string>
      </dict>
      </plist>
    EOS
  end

  test do
    assert_match "skbd version #{version}", shell_output("#{bin}/skbd --version")
  end
end

class Skbd < Formula
  desc "Stark Keybind Daemon"
  homepage "https://github.com/tombell/skbd"
  url "https://github.com/tombell/skbd.git",
      :tag => "v0.0.3",
      :revision => "5131a2085928ec0bfc6b574b6a94d1697aaef8f5"
  head "https://github.com/tombell/skbd.git"

  bottle do
    root_url "https://skbd-builds.s3.amazonaws.com"
    cellar :any_skip_relocation
    sha256 "4b7430ddbeb64d0e07357ce6252563d90bdb8cf6c6cced624dba37678f60bd63" => :catalina
  end

  depends_on :xcode => :build

  depends_on :macos => :catalina

  def install
    (var/"log/skbd").mkpath
    system "make", "package"
    bin.install "#{buildpath}/.build/release/skbd"
  end

  plist_options :manual => "skbd"

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
          <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
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

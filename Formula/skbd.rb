class Skbd < Formula
  desc "Stark Keybind Daemon"
  homepage "https://github.com/tombell/skbd"
  url "https://github.com/tombell/skbd.git",
      tag:      "v0.0.4",
      revision: "d42d61957fd82424496118a173098d1edbc04a4e"
  head "https://github.com/tombell/skbd.git", branch: "main"

  bottle do
    root_url "https://skbd-builds.s3.amazonaws.com"
    sha256 cellar: :any_skip_relocation, catalina: "4b7430ddbeb64d0e07357ce6252563d90bdb8cf6c6cced624dba37678f60bd63"
    sha256 cellar: :any_skip_relocation, monterey: "9c7e2c19394265aea327ea88768014e91d94e8b018bbdd4a7710490955253821"
  end

  depends_on xcode: :build

  depends_on macos: :catalina

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

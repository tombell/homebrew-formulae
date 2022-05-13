class Ensong < Formula
  desc "Watch directories for mixes and tracklists to upload"
  homepage "https://github.com/tombell/ensong"
  url "https://github.com/tombell/ensong.git", tag: "v0.1.2", revision: "ee50a8f8b784adc35de08d005472c0eb5c727c43"
  head "https://github.com/tombell/ensong.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tombell/ensong").install buildpath.children
    cd "src/github.com/tombell/ensong" do
      system "go", "build",
             "-o", bin/"ensong",
             "github.com/tombell/ensong/cmd/ensong"
      prefix.install_metafiles
    end
  end

  plist_options manual: "ensong"

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
          <string>#{opt_bin}/ensong</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardOutPath</key>
        <string>#{var}/log/ensong/ensong.out.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/ensong/ensong.err.log</string>
      </dict>
      </plist>
    EOS
  end
end

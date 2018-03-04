cask 'stark' do
  version '1.1.0'
  sha256 '5204a757872823dd776fda7fc5547895781006a89a258a650f42634e14d86089'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.1.0.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/com.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

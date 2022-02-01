cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '2.1.1'
  sha256 '70f6b7688be45a658e27a3001645e2312fb58c8a4774713073e95da93c257c2c'
  url 'https://s3.amazonaws.com/stark-builds/stark-2.1.1.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

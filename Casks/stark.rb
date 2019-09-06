cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '1.2.1'
  sha256 '33ab9d7f6624cdc84c05ac8ecdcd00efabc40da4fc3bc8009462f2ac3afed6ca'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.2.1.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

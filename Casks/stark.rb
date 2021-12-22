cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '2.1.0'
  sha256 'b156687bf41849d7ab61f434a8564e7b28f81b8a53b22ad2e66057a5a1c3bdb8'
  url 'https://s3.amazonaws.com/stark-builds/stark-2.1.0.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '1.4.0'
  sha256 '8d5dc485e9efa103fd27346cf4344e67c6a012a12b2e18fee879bef0ca1c4a0c'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.4.0.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '1.3.0'
  sha256 '181cf108685c55f9b8fb9e4af4d0ab7d83b56e31a76918a2d07f7490deefa261'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.3.0.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

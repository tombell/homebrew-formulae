cask 'stark' do
  version '1.1.0'
  sha256 '8e90cfe58aa19d79a99320f03700fb419f41b93c302358b95ea3a79272cce8a8'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.1.0.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/com.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '2.1.2'
  sha256 '3e1b0fa05a7460c98b68ce04ba3651414ae312054b4ba37ef66ef0bbf077e9f0'
  url 'https://s3.amazonaws.com/stark-builds/stark-2.1.2.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

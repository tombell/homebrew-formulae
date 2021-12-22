cask 'stark' do
  homepage 'https://github.com/tombell/stark'
  version '2.1.0'
  sha256 'ed2284b06f7eb1947bca64ac91647444ad7c593a'
  url 'https://s3.amazonaws.com/stark-builds/stark-2.1.0.zip'

  name 'Stark'

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

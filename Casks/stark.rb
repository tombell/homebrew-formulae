cask 'stark' do
  version '1.1.1'
  sha256 '46a2eabb702c9ebe186bb8bc522e4f9befe9c54d7e6483a6123a8dfb24807a4f'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.1.1.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/com.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

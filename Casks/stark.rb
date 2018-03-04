cask 'stark' do
  version '1.1.1'
  sha256 '0a76a3f1bee9848a405aee25337f4c946105b3d18737ab57183408b463e445af'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.1.1.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/com.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

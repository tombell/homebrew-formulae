cask 'stark' do
  version '1.0.1'
  sha256 'e1493bed662ff4dd56cf62f98e736d7258c3132903cc2180311337b70251ca6c'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.0.1.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'
  
  zap delete: [
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

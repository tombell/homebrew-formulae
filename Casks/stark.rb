cask 'stark' do
  version '2.1.3'
  sha256 '15794dc1dffafe96e2c63ea574caacee99acc97ccb1133aecdd2f83128918929'

  url 'https://s3.amazonaws.com/stark-builds/stark-2.1.3.zip'
  name 'Stark'
  homepage 'https://github.com/tombell/stark'

  depends_on macos: :monterey

  app 'Stark.app'

  zap delete: [
    '~/Library/LaunchAgents/co.rustyrobots.Stark.plist',
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

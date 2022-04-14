cask 'stark' do
  version '2.1.3'
  sha256 '65ccaec11e8671f4a023f0881abfead9b28702bbafd1aa4069094f5f7b1e956d'

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

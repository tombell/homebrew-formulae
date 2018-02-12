cask 'stark' do
  version '1.0.1'
  sha256 '443561d73fbe1ca74699f038ec2afa47c8b4ec388e4b6cbdfc61ad1afde49732'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.0.2.zip'

  name 'Stark'

  accessibility_access true

  app 'Stark.app'
  
  zap delete: [
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

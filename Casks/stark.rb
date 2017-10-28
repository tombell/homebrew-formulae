cask 'stark' do
  version '1.0.0'
  sha256 '4ca746d592bace64bb20d1ca20d0bed6751dd853b2ff74cc86ca3233b4b50246'
  url 'https://s3.amazonaws.com/stark-builds/stark-1.0.0.zip'

  name 'Stark'
  homepage 'https://usestark.com'

  accessibility_access true

  app 'Stark.app'
  
  zap delete: [
    '~/Library/Preferences/co.rustyrobots.Stark.plist',
  ]
end

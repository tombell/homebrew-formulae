cask 'font-iosevka-custom' do
  version '34.8.0'
  sha256 'a034cf219d58678567a79439fd473f94b9be5d204698bee5d17293b87a6a45af'

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name 'Iosevka Custom'
  desc 'Custom build of the Iosevka typeface'
  homepage 'https://github.com/be5invis/Iosevka/'

  font 'IosevkaCustom.ttc'
end

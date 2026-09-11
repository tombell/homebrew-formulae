cask 'font-iosevka-custom' do
  version '34.8.1'
  sha256 'e8ee06350b7e1d3153362aa17c0d8b5710a4305eedf1035f247958d241e63725'

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name 'Iosevka Custom'
  desc 'Custom build of the Iosevka typeface'
  homepage 'https://github.com/be5invis/Iosevka/'

  font 'IosevkaCustom.ttc'
end

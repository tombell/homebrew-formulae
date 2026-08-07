cask 'font-iosevka-custom' do
  version '34.8.0'
  sha256 '6d02497eae1b5d767c07c7082c58213dcea5a19d66ffcf222083b46aea3b6648'

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name 'Iosevka Custom'
  homepage 'https://github.com/be5invis/Iosevka/'

  font 'IosevkaCustom.ttc'
end

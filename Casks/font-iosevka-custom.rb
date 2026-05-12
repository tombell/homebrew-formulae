cask 'font-iosevka-custom' do
  version '34.5.0'
  sha256 '60fdbf97587f32f002609858b0a11cf518a669bfb1083e67c7911b83bbb6c2db'

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name 'Iosevka Custom'
  homepage 'https://github.com/be5invis/Iosevka/'

  font 'IosevkaCustom.ttc'
end

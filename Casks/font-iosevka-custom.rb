cask 'font-iosevka-custom' do
  version '34.5.0'
  sha256 'c4bdaeaa16351c7080d4b0bcc84cdf11fc90056fba2cef59f69fa00c6ec90ab2'

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name 'Iosevka Custom'
  homepage 'https://github.com/be5invis/Iosevka/'

  font 'IosevkaCustom.ttc'
end

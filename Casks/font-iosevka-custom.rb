cask "font-iosevka-custom" do
  version "33.3.0"
  sha256 "38cbfeb41e267036d31142d3604fc7580ae50b99d37bdcc1f79086dc6db240f3"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

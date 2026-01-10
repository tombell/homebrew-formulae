cask "font-iosevka-custom" do
  version "34.0.0"
  sha256 "b16c286383c2cfcc16291e0772a4db0149e21a83670d9ce6eacecf27158b8c57"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

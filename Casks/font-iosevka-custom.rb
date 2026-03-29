cask "font-iosevka-custom" do
  version "34.3.0"
  sha256 "f5bcafa9ad0c0dc31245bac8283430525702b8e566ee5afe7c428747b58c9118"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

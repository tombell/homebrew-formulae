cask "font-iosevka-custom" do
  version "33.2.6"
  sha256 "40b0fad0cd3163a621757536446a89c334260c8862621ec13aa828dc58644f85"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

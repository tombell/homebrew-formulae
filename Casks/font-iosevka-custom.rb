cask "font-iosevka-custom" do
  version "33.3.5"
  sha256 "e13cf6587f1da625f374793638c4a24de250c22986987212b3e8c8adf45ac26e"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

cask "font-iosevka-custom" do
  version "1.0.0"
  sha256 "5b19c3c139184309a5f29e64dfa3db8ab5171b6f6a9bc8fa8cf99890386e02ff"

  url "https://tombell-homebrew-assets.s3.us-east-1.amazonaws.com/IosevkaCustom-#{version}.zip"
  name "Iosevka Custom"
  homepage "https://github.com/be5invis/Iosevka/"

  font "IosevkaCustom.ttc"
end

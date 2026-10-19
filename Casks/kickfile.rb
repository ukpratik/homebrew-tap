cask "kickfile" do
  version "1.0.1"
  sha256 "6bfafe7adcf2f78cfaebee738b109514af7f580a8d2d570f34020d49da982fce"

  url "https://github.com/ukpratik/kickfile/releases/download/v#{version}/kickFile-macos.dmg"
  name "kickFile"
  desc "Move files between your phone and laptop over Wi-Fi or a hotspot"
  homepage "https://ukpratik.github.io/kickfile/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "kickFile.app"

  zap trash: [
    "~/Library/Application Support/io.github.ukpratik.kickfile",
    "~/Library/Caches/io.github.ukpratik.kickfile",
    "~/Library/Preferences/io.github.ukpratik.kickfile.plist",
    "~/Library/Saved Application State/io.github.ukpratik.kickfile.savedState",
  ]

  caveats <<~EOS
    kickFile is not notarised by Apple yet. The first time you open it, macOS
    blocks it: open System Settings > Privacy & Security and click "Open Anyway".
  EOS
end

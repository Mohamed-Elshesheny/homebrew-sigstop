cask "sigstop" do
  version "0.2.2"
  sha256 "b0c8343fae8574632c50df439b66640fe0273e8ed79ec58570b4a0f69d565dd7"

  url "https://github.com/Mohamed-Elshesheny/sigstop/releases/download/v#{version}/sigstop-#{version}-wood-frog.dmg"
  name "sigstop"
  desc "Break reminders that know what you're doing, and when not to interrupt"
  homepage "https://github.com/Mohamed-Elshesheny/sigstop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "sigstop.app"

  zap trash: [
    "~/Library/Application Support/dev.sigstop.app",
    "~/Library/Preferences/dev.sigstop.app.plist",
  ]

  caveats <<~EOS
    sigstop is ad-hoc signed, not notarized (Apple's Developer Program costs
    99 USD a year). macOS will refuse to open it until the quarantine attribute
    is cleared once:

      xattr -dr com.apple.quarantine "#{appdir}/sigstop.app"

    or build it yourself from source, which needs no clearing at all:
    https://github.com/Mohamed-Elshesheny/sigstop#build
  EOS
end

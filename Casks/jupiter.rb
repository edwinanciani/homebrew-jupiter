cask "jupiter" do
  version :latest
  sha256 :no_check

  url "https://github.com/edwinanciani/jupiter-releases/releases/latest/download/Jupiter.dmg"
  name "Jupiter"
  desc "Voice companion on the notch for Claude Code"
  homepage "https://github.com/edwinanciani/jupiter-releases"

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Jupiter.app"
end

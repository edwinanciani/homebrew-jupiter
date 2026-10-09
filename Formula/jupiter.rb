# Installs Jupiter's installer: `brew install edwinanciani/jupiter/jupiter`, then `jupiter` (JUP-387).
# The sha256 is `shasum -a 256 install.sh` of install.sh on main; bump it and the version together.
class Jupiter < Formula
  desc "Hands-free voice assistant for the Mac, powered by Claude Code"
  homepage "https://github.com/edwinanciani/void-project"
  url "https://raw.githubusercontent.com/edwinanciani/void-project/main/install.sh"
  version "2026.10.09"
  sha256 "d79d41a0d239f28033101f8fa3b8b10129baffae5649ce8eea214433004448cf"

  depends_on :macos

  def install
    libexec.install "install.sh"
    (bin/"jupiter").write <<~SH
      #!/bin/sh
      real="$HOME/.local/share/jupiter/.venv/bin/jupiter"
      if [ -x "$real" ]; then exec "$real" "$@"; fi
      exec /bin/sh "#{libexec}/install.sh" "$@"
    SH
    chmod 0755, bin/"jupiter"
  end

  def caveats
    <<~EOS
      `jupiter` installs Jupiter on its first run and starts the guided setup.
      Afterwards `jupiter` is Jupiter's own command: `jupiter setup`, `jupiter doctor`, `jupiter uninstall`.
      To update, run: sh ~/.local/share/jupiter/install.sh
    EOS
  end

  test do
    assert_path_exists libexec/"install.sh"
  end
end

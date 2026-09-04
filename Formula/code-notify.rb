class CodeNotify < Formula
  desc "Cross-platform desktop notifications for AI coding tools"
  homepage "https://github.com/mylee04/code-notify"
  url "https://github.com/mylee04/code-notify/archive/refs/tags/v1.13.1.tar.gz"
  sha256 "284b6d12b22fae32df78e8922a65bca8208b36e91565ea6c406d580ebb75f16a"
  license "MIT"

  depends_on "terminal-notifier" => :recommended

  def install
    # Install the main executable
    bin.install "bin/code-notify"

    # Create symlinks for aliases
    bin.install_symlink "code-notify" => "cn"
    bin.install_symlink "code-notify" => "cnp"

    # Install library files
    lib.install "lib/code-notify"

    # Update paths in the main script to point to Homebrew locations
    inreplace bin/"code-notify" do |s|
      s.gsub! '$(dirname "$SCRIPT_DIR")/lib/code-notify', "#{lib}/code-notify"
    end
  end

  def post_install
    quiet_system bin/"code-notify", "repair-hooks", "--quiet"
    ohai "Code-Notify installed successfully!"
    ohai ""
    ohai "Quick start:"
    ohai "  cn on                  # Enable notifications"
    ohai "  cn voice on            # Enable voice notifications"
    ohai "  cn status              # Check status"
    ohai ""
    ohai "For more info: https://github.com/mylee04/code-notify"
  end

  test do
    system bin/"code-notify", "version"
    system bin/"cn", "version"
  end
end

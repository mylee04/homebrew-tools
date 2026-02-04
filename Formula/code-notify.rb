class CodeNotify < Formula
  desc "Cross-platform desktop notifications for AI coding tools"
  homepage "https://github.com/mylee04/code-notify"
  url "https://github.com/mylee04/code-notify/archive/v1.5.0.tar.gz"
  sha256 "50de8759d3cd44bce3b480083a399119a5433afad3c6df805bc8429360cd5179"
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
    system "#{bin}/code-notify", "version"
    system "#{bin}/cn", "version"
  end
end

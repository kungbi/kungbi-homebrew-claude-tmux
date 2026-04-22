class ClaudeTmuxSession < Formula
  desc "Claude Code tmux session manager for zsh (macOS)"
  homepage "https://github.com/kungbi/claude-tmux-session"
  url "https://github.com/kungbi/claude-tmux-session/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "3d113028609eaa7a664ea6dc9e4e4a9963e039247e3caed7aa220c1a5203a639"
  license "MIT"

  depends_on "tmux"

  def install
    (share/"claude-tmux-session").install "claude-tmux-session.zsh"
    bin.install "bin/claude-tmux"
  end

  def caveats
    <<~EOS
      Add to ~/.zshrc:
        source "#{share}/claude-tmux-session/claude-tmux-session.zsh"

      Then apply:
        source ~/.zshrc
    EOS
  end

  test do
    assert_match "claude-tmux-session", shell_output("#{bin}/claude-tmux version")
  end
end

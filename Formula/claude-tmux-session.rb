class ClaudeTmuxSession < Formula
  desc "Claude Code tmux session manager for zsh (macOS)"
  homepage "https://github.com/kungbi/claude-tmux-session"
  url "https://github.com/kungbi/claude-tmux-session/archive/refs/tags/v0.2.10.tar.gz"
  sha256 "cbb1d0ea8b3b34709ea7cd6ab9ee7d5868bef3f3ec822f7ff4ce4497db477220"
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

class ClaudeTmuxSession < Formula
  desc "Claude Code tmux session manager for zsh (macOS)"
  homepage "https://github.com/kungbi/claude-tmux-session"
  url "https://github.com/kungbi/claude-tmux-session/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "c4a028aa0d2786d6105473a14ed0f683cd54173864786bf8f80082e2f8f4de38"
  license "MIT"

  depends_on "tmux"

  def install
    (share/"claude-tmux-session").install "claude-tmux-session.zsh"
    bin.install "bin/claude-tmux"
    (share/"claude-tmux-session"/"bin").install "bin/claude-watch"
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

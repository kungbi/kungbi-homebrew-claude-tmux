class ClaudeTmuxSession < Formula
  desc "Claude Code tmux session manager for zsh (macOS)"
  homepage "https://github.com/kungbi/claude-tmux-session"
  url "https://github.com/kungbi/claude-tmux-session/archive/refs/tags/v0.2.13.tar.gz"
  sha256 "bb66d38a834f9394fb0eb94eca867eaad821322e173f3b09ed558d9926fd5b40"
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

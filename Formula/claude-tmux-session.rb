class ClaudeTmuxSession < Formula
  desc "Claude Code tmux session manager for zsh (macOS)"
  homepage "https://github.com/kungbi/claude-tmux-session"
  url "https://github.com/kungbi/claude-tmux-session/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "b494fab9a6c58e514b4db27e50238a47a8d78f35c42edc8e14edc44a7e115208"
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

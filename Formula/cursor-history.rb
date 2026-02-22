class CursorHistory < Formula
  desc "Browse, search, and resume Cursor Agent CLI sessions"
  homepage "https://github.com/nick-fullpath/cursor-history"
  url "https://github.com/nick-fullpath/cursor-history/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "33032e38ba3c1e4396253ed7f2e42be16f489ce61bf9b9f331fe553dc5ba8154"
  license "MIT"

  depends_on "jq"
  depends_on "fzf"
  depends_on "python@3"

  def install
    bin.install "cursor-history"
  end

  def caveats
    <<~EOS
      To enable shell integration (recommended), add to your ~/.zshrc:

        eval "$(cursor-history init zsh)"

      This allows cursor-history to cd to the workspace directory on resume.
    EOS
  end

  test do
    assert_match "cursor-history v#{version}", shell_output("#{bin}/cursor-history version")
    assert_match "USAGE", shell_output("#{bin}/cursor-history help")
  end
end

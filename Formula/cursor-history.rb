class CursorHistory < Formula
  desc "Browse, search, and resume Cursor Agent CLI sessions"
  homepage "https://github.com/nick-fullpath/cursor-history"
  url "https://github.com/nick-fullpath/cursor-history/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "76329c910617e52b43c85e71188786425003d15f943b88fae8580265374b5c2a"
  license "MIT"

  depends_on "jq"
  depends_on "fzf"
  depends_on "python@3"

  def install
    bin.install "cursor-history"
    (lib/"cursor-history").install Dir["lib/*.py"]
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

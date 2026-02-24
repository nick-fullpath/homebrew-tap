class CursorHistory < Formula
  desc "Browse, search, and resume Cursor Agent CLI sessions"
  homepage "https://github.com/nick-fullpath/cursor-history"
  url "https://github.com/nick-fullpath/cursor-history/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "b66dc8eeeb85b02a31c9d1433fe944496326837126afd68b143763be7b56b806"
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

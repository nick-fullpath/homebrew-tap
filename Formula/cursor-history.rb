class CursorHistory < Formula
  desc "Browse, search, and resume Cursor Agent CLI sessions"
  homepage "https://github.com/nick-fullpath/cursor-history"
  url "https://github.com/nick-fullpath/cursor-history/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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

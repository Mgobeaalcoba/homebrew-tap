# Homebrew formula for ia-router. It goes in the tap repo: github.com/Mgobeaalcoba/homebrew-tap  ->  Formula/ia-router.rb
# User installation:   brew install Mgobeaalcoba/tap/ia-router
#
# It is completed AFTER publishing the version on PyPI: replace `url` and `sha256` with those of the source archive (sdist).
#   sha256:  curl -sL <url> | shasum -a 256        (or the one shown at https://pypi.org/project/ia-router/#files)
class IaRouter < Formula
  include Language::Python::Virtualenv

  desc "Routes your tasks across the official AI CLIs using objective metrics from Arena and Artificial Analysis"
  homepage "https://www.mgatc.com/recursos/ia-router/"
  url "https://files.pythonhosted.org/packages/5d/d7/0c0d32f3b0a16a8d3c54dd33f10132f48be5e0540106cd36f3d4fb93eeb8/ia_router-0.4.0.tar.gz"
  sha256 "b7af6abd99256b2143cc841ae2e493712f7c6bc11d7a02c3bdc85c766a2f45de"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources # no Python dependencies: standard library only
  end

  def caveats
    <<~EOS
      ia-router routes to the official CLIs you already have installed and logged in (claude, codex, agy).
      To add speed and cost, create your free Artificial Analysis key and save it in:
        ~/.ia-router/.env      (ARTIFICIAL_ANALYSIS_API_KEY=your_key)
    EOS
  end

  test do
    ENV["ROUTER_HOME"] = testpath.to_s
    assert_match version.to_s, shell_output("#{bin}/ia-router --version")
    assert_match "usage: ia-router", shell_output("#{bin}/ia-router --help")
  end
end

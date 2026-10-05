# Fórmula de Homebrew para ia-router. Va en el repo del tap: github.com/Mgobeaalcoba/homebrew-tap  ->  Formula/ia-router.rb
# Instalación para el usuario:   brew install Mgobeaalcoba/tap/ia-router
#
# Se completa DESPUÉS de publicar la versión en PyPI: reemplazar `url` y `sha256` por los del archivo fuente (sdist).
#   sha256:  curl -sL <url> | shasum -a 256        (o el que muestra https://pypi.org/project/ia-router/#files)
class IaRouter < Formula
  include Language::Python::Virtualenv

  desc "Reparte tus tareas entre los CLIs oficiales de IA con métricas objetivas de Arena y Artificial Analysis"
  homepage "https://www.mgatc.com/recursos/ia-router/"
  url "https://files.pythonhosted.org/packages/94/56/bd6c857286d320f6bab108eb5d7499a4fb64051783feae67faaa8708725a/ia_router-0.2.0.tar.gz"
  sha256 "945f0e889ec5a0e69bef0a4c77fc34984e761fd30c16e49dad64b6727fc4a733"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources # no hay dependencias de Python: solo librería estándar
  end

  def caveats
    <<~EOS
      ia-router rutea hacia los CLIs oficiales que ya tengas instalados y logueados (claude, codex, agy).
      Para sumar velocidad y costo, creá tu clave gratuita de Artificial Analysis y guardala en:
        ~/.ia-router/.env      (ARTIFICIAL_ANALYSIS_API_KEY=tu_clave)
    EOS
  end

  test do
    assert_match "ia-router", shell_output("#{bin}/ia-router --help")
    assert_match "categoría", shell_output("#{bin}/ia-router scores")
  end
end

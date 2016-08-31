require 'helper'
require 'texstyles'

class RenderTest < Minitest::Test
  def setup
    @example_metadata = YAML.load(File.read(File.join('test','fixtures','example_scholarly_article.yml')))
  end

  def test_can_render_without_metadata
    authorea_style = Texstyles::Style.new(:authorea)
    rendered_latex = authorea_style.stylize_metadata

    assert rendered_latex.include?('\\documentclass{article}')
    assert rendered_latex.include?('\\begin{document}')
  end

  def test_can_render_basic_with_metadata
    authorea_style = Texstyles::Style.new(:article)
    rendered_latex = authorea_style.stylize_metadata(@example_metadata)

    assert rendered_latex.include?('\\documentclass{article}')
    assert rendered_latex.include?('\\begin{document}')
    assert rendered_latex.include?('First Author')
    assert rendered_latex.include?('\author{Third Author}')
    assert rendered_latex.include?('\affil{Example Organization}')

  end
end

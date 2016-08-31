require 'helper'
require 'texstyles'

class RenderTest < Minitest::Test
  def setup
    @example_metadata = YAML.load(File.read(File.join('test','fixtures','example_scholarly_article.yml')))
  end

  def test_can_render_without_metadata
    empty_style = Texstyles::Style.new('empty')
    rendered_latex = empty_style.render_latex(@example_metadata)
    assert rendered_latex.include?('\\documentclass{article}')
    assert rendered_latex.include?('\\begin{document}')
  end

  def test_can_render_basic_with_metadata
    empty_style = Texstyles::Style.new('empty')
    rendered_latex = empty_style.render_latex(@example_metadata)
    assert rendered_latex.include?('\\documentclass{article}')
    assert rendered_latex.include?('\\begin{document}')
    assert rendered_latex.include?('First Author')
    assert rendered_latex.include?('Third Author')
  end
end

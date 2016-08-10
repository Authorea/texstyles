require 'helper'
require 'texstyles'

class SanityLoaderTest < Minitest::Test

  def test_hundreds_of_styles_available
    assert Texstyles.list.length > 100, 'hundred of styles are available on the filesystem'
  end

  def test_can_load_all_styles
    categories = Texstyles.categories

    Texstyles.list.each do |symbol|
      style = Texstyles::Style.new(symbol)
      latex_preamble_content = style.render_latex
      assert latex_preamble_content.length > 0, "render is operational for style #{symbol}"
      assert style.name, "style #{symbol} has name set"
      assert style.category, "style #{symbol} has category set"
      assert categories[style.category], "#{style.category} is part of the standard category vocabulary"
    end
  end

end

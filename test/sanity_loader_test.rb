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

  def test_can_check_compatibility
    empty_style = Texstyles::Style.new('empty')
    assert !empty_style.package_compatible?('fakename'), 'all default packages are considered incompatible with the empty style'

    generic_article_style = Texstyles::Style.new('article')
    assert generic_article_style.package_compatible?('fakename'), 'all default packages are considered compatible with the article style'
  end

end

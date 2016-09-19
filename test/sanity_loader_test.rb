require 'helper'
require 'texstyles'

class SanityLoaderTest < Minitest::Test

  def can_respond_to_expected_methods
    assert Texstyles::Style.respond_to?(:citation_style), "can access citation_style"
    assert Texstyles::Style.respond_to?(:name), "can access name"
    assert Texstyles::Style.respond_to?(:category), "can access category"
  end

  def test_hundreds_of_styles_available
    assert Texstyles.list.length > 100, 'hundred of styles are available on the filesystem'
  end

  def test_can_load_all_styles
    categories = Texstyles.categories

    Texstyles.list.each do |symbol|
      style = Texstyles::Style.new(symbol)
      latex_preamble_content = style.stylize_metadata
      assert latex_preamble_content.length > 0, "render is operational for style #{symbol}"
      assert !style.name.empty?, "style #{symbol} has name set"
      assert !style.category.empty?, "style #{symbol} has category set"
      assert categories[style.category], "#{style.category} is part of the standard category vocabulary"
    end
  end

  def test_available_citation_style
    authorea = Texstyles::Style.new(:authorea)
    assert_equal "apacite", authorea.citation_style, "Citation Style for Authorea style is set."
  end

  def test_can_check_compatibility
    empty_style = Texstyles::Style.new('empty')
    assert !empty_style.package_compatible?('fakename'), 'all default packages are considered incompatible with the empty style'

    generic_article_style = Texstyles::Style.new('article')
    assert generic_article_style.package_compatible?('fakename'), 'all default packages are considered compatible with the article style'
  end

end

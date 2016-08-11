require 'erb'
require 'yaml'

module Texstyles
  class Style
    attr_accessor :symbol

    def initialize(symbol = :authorea)
      @symbol = symbol.to_sym
      style_filename = "#{@symbol}.tex.erb"
      style_filepath = File.join(Texstyles.root, 'styles', style_filename)
      @erb = if File.exist? style_filepath
        ERB.new(File.read(style_filepath))
      else
        nil
      end

      meta_filename = "#{@symbol}.yml"
      meta_filepath = File.join(Texstyles.root, 'meta', meta_filename)
      @meta = if File.exist? meta_filepath
        YAML.load_file(meta_filepath)
      else
        {}
      end
      @default_packages = @meta['default_packages'] || {}
      @all_rule = @default_packages['*']
      @all_compatible = (@all_rule == true)
      @none_compatible = (@all_rule == false)
    end

    def render_latex
      @erb && @erb.result(binding)
    end

    def name
      @meta['name']
    end

    def category
      @meta['category']
    end

    def package_compatible?(package_name)
      @all_compatible || (!@none_compatible && (@default_packages[package_name] != false))
    end

  end
end
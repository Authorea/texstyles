require 'erb'
require 'yaml'

module Texstyles
  class Style
    attr_accessor :symbol

    def initialize(symbol=:authorea)
      @symbol = symbol.to_sym
      style_filename = "#{@symbol}.tex.erb"
      style_filepath = File.join(Texstyles.root, 'styles', style_filename)
      @erb = if File.exist? style_filepath
        ERB.new(File.read(style_filepath))
      else
        nil
      end

      spec_filename = "#{@symbol}.yml"
      spec_filepath = File.join(Texstyles.root, 'spec', spec_filename)
      @spec = if File.exist? spec_filepath
        YAML.load_file(spec_filepath)
      else
        {}
      end
    end

    def render_latex
      @erb && @erb.result(binding)
    end

    def name
      @spec['name']
    end

    def category
      @spec['category']
    end

  end
end
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
      @meta_default_packages = @meta['default_packages'] || {}
      @all_rule = @meta_default_packages['*']
      @all_compatible = (@all_rule == true)
      @none_compatible = (@all_rule == false)
    end

    def render_latex(options = {})
      @default_packages = options[:default_packages].to_s
      @header = options[:header].to_s
      @alternative_author_string = options[:alternative_author_string].to_s
      @title = options[:title].to_s
      @short_title = options[:short_title].to_s
      @first_author = options[:first_author].to_s
      @first_affiliation = options[:first_affiliation].to_s
      @coauthor_list = options[:coauthor_list].to_a
      @coauthor_affiliations = options[:coauthor_affiliations].to_a

      @abstract = options[:abstract].to_s
      if !@abstract.empty?
        @abstract_begin_end = if @abstract.match(/\{abstract\}/)
          @abstract
        else
          "\\begin{abstract}\n" + @abstract + "%\n\\end{abstract}%\n"
        end
        @abstract_command = "\\abstract{" + @abstract + "%\n}\n\n"
      else
        @abstract_begin_end = ""
        @abstract_command = ""
      end

      @erb && @erb.result(binding)
    end

    def name
      @meta['name']
    end

    def category
      @meta['category']
    end

    def package_compatible?(package_name)
      @all_compatible || (!@none_compatible && (@meta_default_packages[package_name] != false))
    end

  end
end
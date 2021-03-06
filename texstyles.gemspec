# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "texstyles"
  spec.version       = "0.0.9"

  spec.authors       = ["Deyan Ginev"]
  spec.email         = ["deyan@authorea.com"]

  spec.summary       = %q{A collection of styling templates for LaTeX documents, with a focus on scholarly manuscripts}
  spec.description   = %q{Hundreds of styles fueling Authorea.com's exporter to PDF. Use with the "exportstylist" gem for a Ruby API.}
  spec.homepage      = "https://github.com/Authorea/texstyles"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'escape_utils', '~> 1.2'
  spec.add_dependency 'json', '~> 1.8'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"

end

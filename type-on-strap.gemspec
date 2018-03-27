# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "sonpro"
  spec.version       = "0.1.1"
  spec.email         = ["isonpro@gmail.com"]

  spec.summary       =  "A simple and responsive jekyll theme template"
  spec.description   = %q{say something..}
  spec.homepage      = "https://github.com/sylhare/Type-on-Strap"

  spec.files         = Dir.glob("**/{*,.*}").select do |f|
    f.match(%r{^(assets/(js|css|fonts)|_(includes|layouts|sass)/|(LICENSE|README.md))}i)
  end

  spec.required_ruby_version = '~> 2.1'

  spec.add_runtime_dependency "jekyll", "~> 3.3"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'svpply/version'

Gem::Specification.new do |gem|
  gem.name          = "svpply-ruby"
  gem.version       = Svpply::VERSION
  gem.authors       = ["Matthew DuVall"]
  gem.email         = ["mduvall89@gmail.com"]
  gem.description   = %q{Make API calls to Svpply}
  gem.summary       = %q{A simple wrapper layer around the Svpply 1.0 API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

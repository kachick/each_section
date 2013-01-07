lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'each_section/version'

Gem::Specification.new do |gem|
  gem.name          = 'each_section'
  gem.version       = EachSection::VERSION.dup
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.licenses      = ['MIT']
  gem.summary       = 'each_line with Regular Expression separators'
  gem.description   = gem.summary.dup
  gem.homepage      = 'http://kachick.github.com/each_section'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 1.8.7'

  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
end

# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vnstat/version'

Gem::Specification.new do |spec|
  spec.name = 'vnstat-ruby'
  spec.version = Vnstat::VERSION
  spec.authors = ['Tobias Casper']
  spec.email = ['tobias.casper@gmail.com']

  spec.summary = 'A library to track your network traffic using vnstat.'
  spec.description =
    'Utilizes the the vnstat CLI to track your network traffic.'
  spec.homepage = 'https://github.com/tlux/vnstat-ruby'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this section
  # to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~> 1.8'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53'
  spec.add_development_dependency 'yard', '~> 0.9.12'
end

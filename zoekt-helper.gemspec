Gem::Specification.new do |s|
  s.name        = 'zoekt-helper'
  s.version     = '0.0.6'
  s.date        = '2017-06-20'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Victor Pereira"]
  s.email       = 'vpereira@suse.com'
  s.files       = ["lib/zoekt-helper.rb","lib/zoekt-helper/osc.rb","lib/zoekt-helper/zoekt_index.rb","bin/zoekt-helper"]
  s.executables << "zoekt-helper"
  s.add_runtime_dependency 'cheetah','~> 0'
  s.add_runtime_dependency 'docopt', '~> 0'
  s.homepage    =
    'http://rubygems.org/gems/zoekt-helper'
  s.license       = 'MIT'
end

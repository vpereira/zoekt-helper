Gem::Specification.new do |s|
  s.name        = 'zoekt-helper'
  s.version     = '0.0.0'
  s.date        = '2017-06-20'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Victor Pereira"]
  s.email       = 'vpereira@suse.com'
  s.files       = ["lib/zoekt-helper.rb","lib/osc.rb","lib/zoekt-index.rb","bin/zoekt-helper"]
  s.executables << "zoekt-helper"
  s.add_dependency("cheetah")
  s.add_dependency("docopt")
  s.homepage    =
    'http://rubygems.org/gems/zoekt-helper'
  s.license       = 'MIT'
end

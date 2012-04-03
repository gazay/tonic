# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tonic/version"

Gem::Specification.new do |s|
  s.name        = "tonic"
  s.version     = Tonic::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['gazay']
  s.email       = ['alex.gaziev@gmail.com']
  s.homepage    = "https://github.com/gazay/tonic"
  s.summary     = %q{Create github pages easy with Sass, Haml/Slim, Coffee.}
  s.description = %q{You don't need to write your github pages in html and css anymore - now it's simple to use your favorite technologies with tonic!}

  s.rubyforge_project = "tonic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib", "bin"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end

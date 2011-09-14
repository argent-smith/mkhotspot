# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mkhotspot/version"

Gem::Specification.new do |s|
  s.name        = "mkhotspot"
  s.version     = Mkhotspot::VERSION
  s.authors     = ["Pavel Argentov"]
  s.email       = ["argentoff@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "mkhotspot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "ZenTest"
  s.add_development_dependency "test-unit"
  s.add_development_dependency "redgreen"
  s.add_development_dependency "ruby-graphviz"

end

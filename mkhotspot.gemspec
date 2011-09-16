# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mkhotspot/version"

Gem::Specification.new do |s|
  s.name        = "mkhotspot"
  s.version     = Mkhotspot::VERSION
  s.authors     = ["Pavel Argentov"]
  s.email       = ["argentoff@gmail.com"]
  s.homepage    = "https://github.com/argent-smith/mkhotspot"
  s.summary     = %q{ISP's simple hotspot generator}
  s.description = %q{Generates BRAS and portal configs for a hotspot with given name.}

  s.rubyforge_project = "mkhotspot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency  "rake"
  s.add_development_dependency  "rspec"
  s.add_development_dependency  "aruba"
  s.add_development_dependency  "cucumber"
  s.add_development_dependency  "ZenTest"
  s.add_development_dependency  "test-unit"
  s.add_development_dependency  "redgreen"
  s.add_development_dependency  "ruby-graphviz"

  s.add_dependency              "thor"

end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "novareport-client"
  s.version     = "0.0.1"
  s.authors     = ["Xavier Dutreilh"]
  s.email       = ["xavier@dutreilh.fr"]
  s.homepage    = "http://github.com/novagile/novareport-client"
  s.summary     = %q{Measure pusher for Nova Report}
  s.description = %q{Nova Report Client is a tool that pushes measures to a Nova Report instance.}

  s.rubyforge_project = "nova_report-client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "httparty"

  s.add_development_dependency "rspec"
end

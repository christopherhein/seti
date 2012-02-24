# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "seti/version"

Gem::Specification.new do |s|
  s.name        = "seti"
  s.version     = Seti::VERSION
  s.authors     = ["Christopher Hein", "Nick Hodulik", "General Things Inc"]
  s.email       = ["chris@generalthings.com", "nick@generalthings.com"]
  s.homepage    = ""
  s.summary     = %q{Simple API connector for getting ATA data from SETIInfo}
  s.description = %q{Simple API connector for getting ATA data from SETIInfo}

  s.rubyforge_project = "seti"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "faraday_middleware"
  s.add_runtime_dependency "hashie"
  s.add_runtime_dependency "multi_xml"
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "ruby_gntp"
end

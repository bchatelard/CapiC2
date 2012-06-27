#-*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name = "CapiC2"
  s.version = CapiC2::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Bastien Chatelard"]
  s.email = ["chatelard.bastien@gmail.com"]
  s.homepage = "http://github.com/chatelardbastien"
  s.summary = %q{Capistrano EC2 deployement recipes}
  s.description = %q{Extend the Capistrano gem with EC2 instance listing}

  s.required_rubygems_version = ">= 1.3.6"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "capistrano", ">= 2.5.9"
  s.add_dependency "aws-sdk"
end

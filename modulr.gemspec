# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "modulr/version"


Gem::Specification.new do |s|
  s.name = %q{modulr}
  s.version = Modulr::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tobie Langel"]
  s.date = %q{2010-11-01}
  s.default_executable = %q{modulrize}
  s.email = %q{tobie.langel@gmail.com}
  s.files         = `git ls-files`.split("\n") << "vendor/rkelly/lib/rkelly/generated_parser.rb"
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  
  s.homepage = %q{http://github.com/codespeaks/modulr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A CommonJS module implementation in Ruby for client-side JavaScript}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<coffee_machine>, [">= 0"])
    else
      s.add_dependency(%q<coffee_machine>, [">= 0"])
    end
  else
    s.add_dependency(%q<coffee_machine>, [">= 0"])
  end
end


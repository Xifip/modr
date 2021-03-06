# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "railroady"
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Preston Lee", "Tobias Crawley", "Peter Hoeg", "Javier Smaldone"]
  s.date = "2016-06-28"
  s.description = "Ruby on Rails 3/4 model and controller UML class diagram generator. Originally based on the 'railroad' plugin and contributions of many others. (`brew install graphviz` before use!)"
  s.email = ["preston.lee@prestonlee.com", "tcrawley@gmail.com", "peter@hoeg.com", "p.hoeg@northwind.sg", "javier@smaldone.com.ar"]
  s.executables = ["railroady"]
  s.files = ["bin/railroady"]
  s.homepage = "http://github.com/preston/railroady"
  s.licenses = ["GPLv2"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Ruby on Rails 3/4 model and controller UML class diagram generator."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

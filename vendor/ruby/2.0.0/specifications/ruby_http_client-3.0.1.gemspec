# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby_http_client"
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Elmer Thomas"]
  s.date = "2017-01-25"
  s.description = "Quickly and easily access any REST or REST-like API."
  s.email = "dx@sendgrid.com"
  s.homepage = "http://github.com/sendgrid/ruby-http-client"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "A simple REST client"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 0"])
    else
      s.add_dependency(%q<rake>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0"])
  end
end

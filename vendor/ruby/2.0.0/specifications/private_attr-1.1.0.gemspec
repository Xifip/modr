# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "private_attr"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Swanner"]
  s.date = "2015-02-17"
  s.description = "Easily create private/protected attribute readers/writers"
  s.email = ["jacob@jacobswanner.com"]
  s.homepage = "https://github.com/jswanner/private_attr"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Easily create private/protected attribute readers/writers"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end

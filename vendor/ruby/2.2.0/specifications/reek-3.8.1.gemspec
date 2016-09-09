# -*- encoding: utf-8 -*-
# stub: reek 3.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "reek"
  s.version = "3.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kevin Rutherford", "Timo Roessner", "Matijs van Zuijlen", "Piotr Szotkowski"]
  s.date = "2015-12-27"
  s.description = "    Reek is a tool that examines Ruby classes, modules and methods and reports\n    any code smells it finds.\n"
  s.email = ["timo.roessner@googlemail.com"]
  s.executables = ["reek"]
  s.extra_rdoc_files = ["CHANGELOG.md", "License.txt"]
  s.files = ["CHANGELOG.md", "License.txt", "bin/reek"]
  s.homepage = "https://github.com/troessner/reek/wiki"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md", "-x", "assets/|bin/|config/|features/|spec/|tasks/"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.5"
  s.summary = "Code smell detector for Ruby"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<codeclimate-engine-rb>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<parser>, [">= 2.2.2.5", "~> 2.2"])
      s.add_runtime_dependency(%q<private_attr>, ["~> 1.1"])
      s.add_runtime_dependency(%q<rainbow>, ["~> 2.0"])
      s.add_runtime_dependency(%q<unparser>, ["~> 0.2.2"])
      s.add_development_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_development_dependency(%q<aruba>, ["~> 0.10.0"])
      s.add_development_dependency(%q<ataru>, ["~> 0.2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<cucumber>, ["~> 2.0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.34.0"])
    else
      s.add_dependency(%q<codeclimate-engine-rb>, ["~> 0.1.0"])
      s.add_dependency(%q<parser>, [">= 2.2.2.5", "~> 2.2"])
      s.add_dependency(%q<private_attr>, ["~> 1.1"])
      s.add_dependency(%q<rainbow>, ["~> 2.0"])
      s.add_dependency(%q<unparser>, ["~> 0.2.2"])
      s.add_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_dependency(%q<aruba>, ["~> 0.10.0"])
      s.add_dependency(%q<ataru>, ["~> 0.2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<cucumber>, ["~> 2.0"])
      s.add_dependency(%q<factory_girl>, ["~> 4.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.34.0"])
    end
  else
    s.add_dependency(%q<codeclimate-engine-rb>, ["~> 0.1.0"])
    s.add_dependency(%q<parser>, [">= 2.2.2.5", "~> 2.2"])
    s.add_dependency(%q<private_attr>, ["~> 1.1"])
    s.add_dependency(%q<rainbow>, ["~> 2.0"])
    s.add_dependency(%q<unparser>, ["~> 0.2.2"])
    s.add_dependency(%q<activesupport>, ["~> 4.2"])
    s.add_dependency(%q<aruba>, ["~> 0.10.0"])
    s.add_dependency(%q<ataru>, ["~> 0.2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<cucumber>, ["~> 2.0"])
    s.add_dependency(%q<factory_girl>, ["~> 4.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.34.0"])
  end
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "capistrano3-unicorn"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Lineen"]
  s.date = "2014-01-06"
  s.description = "Unicorn specific Capistrano tasks"
  s.email = ["matthew@lineen.com"]
  s.homepage = "https://github.com/tablexi/capistrano3-unicorn"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Unicorn specific Capistrano tasks"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 3.0.0"])
    else
      s.add_dependency(%q<capistrano>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 3.0.0"])
  end
end

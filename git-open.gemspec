# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "git/open/version"

Gem::Specification.new do |spec|
  spec.name          = "git-open"
  spec.version       = Git::Open::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %q{Type `git open` to open the repository in your browser.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JuanitoFatas/git-open"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|bin)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["git-open"]
  spec.require_paths = ["lib"]

  spec.add_dependency "slop", "~> 4.0"
  spec.add_dependency "git-remote-parser"
  spec.add_dependency "launchy"
end

# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "skeleton_rust_gem/version"

Gem::Specification.new do |spec|
  spec.name = "skeleton_rust_gem"
  spec.version = SkeletonRustGem::VERSION
  spec.summary = "Skeletal rust gem."
  spec.description = spec.summary
  spec.authors = ["Guillaume Yziquel"]
  spec.license = "MIT"
  spec.homepage = "https://github.com/gl-yziquel"

  spec.required_ruby_version = ">= 3.1"
  spec.required_rubygems_version = ">= 3.3.11"

  spec.files = ["README.md", "Cargo.lock", "Cargo.toml"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("ext/**/*.{rs,toml,lock,rb}")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
 
  spec.require_paths = ["lib"]
  spec.extensions = ["ext/skeleton_rust_gem/extconf.rb"]

  spec.metadata["allowed_push_host"] = spec.homepage
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rake-compiler", "~> 1.2"
  spec.add_development_dependency "rb_sys", "~> 0.9"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

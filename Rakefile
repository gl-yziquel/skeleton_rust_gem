# frozen_string_literal: true

require "bundler/gem_tasks"
require "rb_sys/extensiontask"

task build: :compile

GEMSPEC = Gem::Specification.load("skeleton_rust_gem.gemspec")

RbSys::ExtensionTask.new("skeleton_rust_gem", GEMSPEC) do |ext|
  ext.lib_dir = "lib/skeleton_rust_gem"
end

task default: :compile

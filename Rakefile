# frozen_string_literal: true

require "bundler/gem_tasks"
SKELETON_GEMSPEC = Bundler.load_gemspec("skeleton_rust_gem.gemspec")

require "rb_sys/extensiontask"
RbSys::ExtensionTask.new("skeleton_rust_gem", SKELETON_GEMSPEC) do |ext|
  ext.lib_dir = "lib/skeleton_rust_gem"
end

#  RSpec::Core::RakeTask.new(:spec)

task build: :compile
task default: :compile

#require "rubygems/package_task"
#gem_path = Gem::PackageTask.new(SKELETON_GEMSPEC).define
#desc "Package the Ruby gem"
#task "package" => [gem_path]

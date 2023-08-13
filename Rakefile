require "bundler/gem_tasks"
require "rake/extensiontask"
require "rspec/core/rake_task"

gemspec = Gem::Specification.load(File.expand_path("*.gemspec", __dir__))

Rake::ExtensionTask.new("fiddle_file_stat_ext", gemspec) do |ext|
  ext.ext_dir = "ext/fiddle_file_stat_ext"
  ext.cross_compile = false
end

RSpec::Core::RakeTask.new(:spec)

task :spec => [:clean, :compile]

task :default => :spec

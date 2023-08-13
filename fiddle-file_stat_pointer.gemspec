# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fiddle-file-stat"
  spec.version       = "1.0.0"
  spec.authors       = ["Samuel Cochran"]
  spec.email         = ["sj26@sj26.com"]
  spec.description   = "Fiddle support for File::Stat"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/sj26/fiddle-file-stat"
  spec.license       = "MIT"

  spec.files = Dir.chdir(__dir__) { Dir[
    "README*",
    "LICENSE*",
    "bin/*",
    "lib/**/*",
  ] }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.extensions    = ["ext/fiddle_file_stat_ext/extconf.rb"]
  spec.require_paths = ["lib", "ext/fiddle_file_stat_ext"]

  spec.add_dependency "fiddle"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", '~> 3.3'
end

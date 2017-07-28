# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zt_btce/version"

Gem::Specification.new do |spec|
  spec.name          = "zt_btce"
  spec.version       = ZtBtce::VERSION
  spec.authors       = ["Zhenya Telyukov"]
  spec.email         = ["telyukov@gmail.com"]

  spec.summary       = %q{Ruby-BTCE API}
  spec.description   = %q{To develop and test BTCE API on Ruby / RoR / CLI}
  spec.homepage      = "http://dummy.com"
#  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin" #"exe"
  spec.executables   = ["zt_btce"] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'json'
  spec.add_dependency 'hashie'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

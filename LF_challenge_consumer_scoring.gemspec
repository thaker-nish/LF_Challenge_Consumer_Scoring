# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'LF_challenge_consumer_scoring/version'

Gem::Specification.new do |spec|
  spec.name          = "LF_challenge_consumer_scoring"
  spec.version       = LFChallengeConsumerScoring::VERSION
  spec.authors       = ["Nishant Thaker"]
  spec.email         = ["thaker.nish@gmail.com\n"]

  spec.summary       = %q{API client for Leapfrog Online consumer scoring.}
  spec.description   = %q{This API client will use a consumers income, zip code, and age to return scoring advice about the consumer.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "json"
end

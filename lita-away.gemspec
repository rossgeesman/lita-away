Gem::Specification.new do |spec|
  spec.name          = "lita-away"
  spec.version       = "0.1.0"
  spec.authors       = ["Ross Geesman"]
  spec.email         = ["rossgeesman@gmail.com"]
  spec.description   = "afk away message handler for lita.io"
  spec.summary       = "lita-way saves 'away from keyboard' status messages and informs users via DM if they @mention a user who is currently afk."
  spec.homepage      = "http://blog.prettymuchallofthetime.com/"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end

require_relative 'lib/utility_scripts/version'

Gem::Specification.new do |spec|
  spec.name          = "utility_scripts"
  spec.version       = UtilityScripts::VERSION
  spec.authors       = ["Dileep Reddy"]
  spec.email         = ["dileep315@gmail.com"]

  spec.summary       = %q{Contains automation scripts for the routine tasks}
  spec.description   = %q{Contains automation scripts for the routine tasks}
  spec.homepage      = "https://github.com/dileep315/utility_scripts"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://localhost"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dileep315/utility_scripts"
  spec.metadata["changelog_uri"] = "https://github.com/dileep315/utility_scripts/tags"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

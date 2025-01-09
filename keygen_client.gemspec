# frozen_string_literal: true

require_relative "lib/keygen_client/version"

Gem::Specification.new do |spec|
  spec.name = "keygen_client"
  spec.version = KeygenClient::VERSION
  spec.authors = ["Matthew Schoolmaster"]
  spec.email = ["schoolmaster@gmail.com"]

  spec.summary = %q{API Client for keygen.sh licensing server}
  spec.description = %q{API Client for keygen.sh licensing server}
  spec.homepage = "http://github.com/theschoolmaster/keygen_client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/theschoolmaster/keygen_client"
  spec.metadata["changelog_uri"] = "http://github.com/theschoolmaster/keygen_client/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty"
  spec.add_dependency "minitest", '~> 5'
  spec.add_dependency "rake"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# frozen_string_literal: true

require_relative "lib/btn/version"

Gem::Specification.new do |spec|
  spec.name = "btn"
  spec.version = Btn::VERSION
  spec.authors = ["Jason Franklin"]
  spec.email = ["mobile_releases@xing.com"]

  spec.summary = "Bitrise(bitrise.io) MS Teams notifier"
  spec.description = "Send out MS Teams notifications if Bitrise builds failed, succeeded, were aborted."
  spec.homepage = "https://github.com/xing/btn.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/xing/btn.git"
  spec.metadata["changelog_uri"] = "https://github.com/xing/btn/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_dependency "ms_teams", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end

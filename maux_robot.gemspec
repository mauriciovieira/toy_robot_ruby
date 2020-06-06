# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'maux_robot/version'
require 'English'
Gem::Specification.new do |s|
  s.name = 'maux_robot'
  s.version = MauxRobot::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.6.0'
  s.authors = ['Mauricio Vieira']
  s.description = <<-DESCRIPTION
    Maux version of a Toy Robot Simulator.
  DESCRIPTION

  s.email = 'maux_robot@mauriciovieira.net'
  s.files = `git ls-files bin lib LICENSE README.md \
             spec`
            .split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.homepage = 'https://github.com/mauriciovieira/maux_robot'
  s.licenses = ['GPL-3.0']
  s.summary = 'Maux version of a Toy Robot Simulator.'

  if s.respond_to?(:metadata=)
    s.metadata = {
      'homepage_uri' => 'https://github.com/mauriciovieira/maux_robot/blob/master/README.md',
      'changelog_uri' => 'https://github.com/mauriciovieira/maux_robot/blob/master/CHANGELOG.md',
      'source_code_uri' => 'https://github.com/mauriciovieira/maux_robot/',
      'documentation_uri' => 'https://github.com/mauriciovieira/maux_robot/',
      'bug_tracker_uri' => 'https://github.com/mauriciovieira/maux_robot/issues'
    }
  end

  s.add_development_dependency('standard')
end

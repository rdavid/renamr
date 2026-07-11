# frozen_string_literal: true

# SPDX-FileCopyrightText: 2023-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'renamr'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.required_ruby_version = '>=3.2'
  s.name = 'renamr'
  s.version = Renamr::VERSION
  s.summary = 'File and directory name normalizer'
  s.description = <<-HERE
    Renamr normalizes file and directory names. It rewrites them with
    lowercase English letters, digits, and hyphens in place of spaces and
    other symbols.
  HERE
  s.license = '0BSD'
  s.author = 'David Rabkin'
  s.email = 'david@rabkin.co.il'
  s.homepage = 'https://github.com/rdavid/renamr'
  s.files = `git ls-files | grep -E -v '^(test/|\\.)'`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.extra_rdoc_files = ['LICENSE', 'README.adoc']
  s.metadata['rubygems_mfa_required'] = 'true'
end

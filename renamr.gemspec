# frozen_string_literal: true

# SPDX-FileCopyrightText: 2023-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'lib/renamr/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 3.2'
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
  s.files = `git ls-files -z bin lib LICENSE README.adoc`.split("\x0")
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.extra_rdoc_files = ['LICENSE', 'README.adoc']
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'homepage_uri' => s.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => s.homepage
  }
  s.add_dependency 'ellipsized', '~> 0.3'
  s.add_dependency 'i18n', '~> 1.15'
  s.add_dependency 'terminal-table', '~> 4.0'
end

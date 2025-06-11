# frozen_string_literal: true

# SPDX-FileCopyrightText: 2023-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'renamr'

Gem::Specification.new do |s|
  s.name = 'renamr'
  s.version = Renamr::VERSION
  s.date = Renamr::DATE
  s.required_ruby_version = '>2.6'
  s.summary = 'File and directory names organiser.'
  s.description = <<-HERE
    Renamr organises multiple files and directories.
  HERE
  s.license = '0BSD'
  s.author = 'David Rabkin'
  s.email = 'david@rabkin.co.il'
  s.homepage = 'https://github.com/rdavid/renamr'
  s.files = Dir['{bin,lib}/**/*'] + Dir['[A-Z]*'] + ['renamr.gemspec']
  s.executables = ['renamr']
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ['lib']
  s.add_runtime_dependency 'date', '~>3.3'
  s.add_runtime_dependency 'fileutils', '~>1.7'
  s.add_runtime_dependency 'i18n', '~>1.12'
  s.add_runtime_dependency 'pidfile', '~>0.3'
  s.add_runtime_dependency 'terminal-table', '>=3', '<5'
  s.add_development_dependency 'minitest', '~>5.8'
  s.add_development_dependency 'rake', '~>13.0'
  s.add_development_dependency 'rubocop', '~>1.50'
end

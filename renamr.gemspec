# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'renamr'

Gem::Specification.new do |s|
  s.name = 'renamr'
  s.version = Renamr::VERSION
  s.required_ruby_version = '>= 2.3'
  s.summary = 'File and directory names organiser.'
  s.description = <<-HERE
    Renamr organises multiple files and directories.
  HERE
  s.license = 'BSD-2-Clause'
  s.author = 'David Rabkin'
  s.email = 'pub@rabkin.co.il'
  s.homepage = 'https://github.com/rdavid/renamr'
  s.files = Dir['{bin,lib}/**/*'] + Dir['[A-Z]*'] + ['renamr.gemspec']
  s.executables = ['renamr']
  s.extra_rdoc_files = ['LICENSE', 'README.md']
  s.require_paths = ['lib']
  s.add_runtime_dependency 'fileutils', '0.3.0'
  s.add_runtime_dependency 'i18n', '1.7.0'
  s.add_runtime_dependency 'pidfile', '0.3.0'
  s.add_runtime_dependency 'terminal-table', '1.8.0'
  s.add_development_dependency 'rubocop', '0.76.0'
end

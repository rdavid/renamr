# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2020-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

task default: %w[test]

desc 'Run the test suite'
task :test do
  ruby 'test/test_char.rb'
  ruby 'test/test_date.rb'
  ruby 'test/test_trim.rb'
end

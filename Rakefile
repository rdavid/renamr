# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2020-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

task default: %w[test]

desc 'Run the test suite'
task :test do
  ruby 'test/test_char.rb'
  ruby 'test/test_date.rb'
  ruby 'test/test_trim.rb'
end

# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'fileutils'
require 'minitest/autorun'
require 'tmpdir'
require_relative '../lib/renamr/prepend_date'

# Defines tests for PrependDateAction.
class TestPrependDate < Minitest::Test
  def test_act
    Dir.mktmpdir do |dir|
      path = File.join(dir, 'f.txt')
      FileUtils.touch(path)
      tim = Time.new(2020, 11, 2, 3, 4, 5)
      File.utime(tim, tim, path)
      act = Renamr::PrependDateAction.new(dir)
      act.set('f.txt')

      assert_equal('20201102-f.txt', act.do(+'f.txt'))
    end
  end
end

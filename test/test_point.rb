# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'fileutils'
require 'minitest/autorun'
require 'tmpdir'
require_relative '../lib/renamr/point'

# Defines tests for PointAction.
class TestPoint < Minitest::Test
  def test_act
    Dir.mktmpdir do |dir|
      FileUtils.touch(File.join(dir, 'a.b.txt'))
      act = Renamr::PointAction.new(dir)

      assert_equal('a-b.txt', act.do(+'a.b.txt'))
      assert_equal('x-y', act.do(+'x.y'))
    end
  end

  def test_validation
    assert_raises(RuntimeError) { Renamr::PointAction.new(nil) }
  end
end

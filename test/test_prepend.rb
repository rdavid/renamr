# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/prepend'

# Defines tests for PrependAction.
class TestPrepend < Minitest::Test
  def test_act
    assert_equal('x-abc', Renamr::PrependAction.new(0, 'x-').do(+'abc'))
    assert_equal('ab-x-cd', Renamr::PrependAction.new(2, '-x-').do(+'abcd'))
  end

  def test_validation
    assert_raises(RuntimeError) { Renamr::PrependAction.new(nil, 'x') }
    assert_raises(RuntimeError) { Renamr::PrependAction.new(0, nil) }
  end
end

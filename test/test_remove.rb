# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/remove'

# Defines tests for RemoveAction.
class TestRemove < Minitest::Test
  def setup
    @act = Renamr::RemoveAction.new(1, 2)
  end

  def test_act
    assert_equal('cdef', @act.do(+'abcdef'))
  end

  def test_validation
    assert_raises(RuntimeError) { Renamr::RemoveAction.new(nil, 1) }
    assert_raises(RuntimeError) { Renamr::RemoveAction.new(1, nil) }
    assert_raises(RuntimeError) { Renamr::RemoveAction.new(0, 1) }
  end
end

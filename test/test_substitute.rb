# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/substitute'

# Defines tests for SubstituteAction.
class TestSubstitute < Minitest::Test
  def setup
    @act = Renamr::SubstituteAction.new('foo', 'bar')
  end

  def test_act
    assert_equal('bar-x-bar', @act.do(+'foo-x-foo'))
  end

  def test_dot_and_default
    act = Renamr::SubstituteAction.new('a.b', nil)

    assert_equal('--c', act.do(+'a-b-c'))
  end
end

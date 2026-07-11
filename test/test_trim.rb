# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2020-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/trim'

# Defines tests for TrimAction.
class TestTrim < Minitest::Test
  def setup
    @act = Renamr::TrimAction.new
  end

  def test_act
    assert_equal('-', @act.do(+'-'))
    assert_equal('-', @act.do(+'--'))
    assert_equal('1', @act.do(+'1-'))
    assert_equal('1', @act.do(+'-1'))
    assert_equal('1-1', @act.do(+'-1--1-'))
  end
end

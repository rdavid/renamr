# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2020-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/trim'

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

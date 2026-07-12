# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/rutoen'

# Defines tests for RuToEnAction.
class TestRuToEn < Minitest::Test
  def setup
    @act = Renamr::RuToEnAction.new
  end

  def test_act
    assert_equal('privet', @act.do(+'привет'))
    assert_equal('jozh', @act.do(+'ёж'))
    assert_equal('-num-5-usd-2', @act.do(+'№5 $2'))
  end
end

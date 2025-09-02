# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2020-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/date'

# Test DateAction class.
class TestChar < Minitest::Test
  def setup
    @act = Renamr::DateAction.new
  end

  def good
    assert_equal('1 20201031 bar', @act.do(+'1 31-10-2020 bar'))
    assert_equal('2 20201031 bar', @act.do(+'2 10-31-2020 bar'))
    assert_equal('3 20201031 bar', @act.do(+'3 2020-10-31 bar'))
    assert_equal('4 20201031 bar', @act.do(+'4 2020-31-10 bar'))
  end

  def bad
    assert_equal('5 2nd Nov 2020 bar', @act.do(+'5 2nd Nov 2020 bar'))
    assert_equal('6 1-1-1-1 bar', @act.do(+'6 1-1-1-1 bar'))
  end

  def test_act
    good
    bad
  end
end

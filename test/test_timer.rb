# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/timer'

# Defines tests for Timer.
class TestTimer < Minitest::Test
  def test_act
    tim = Timer.new

    assert_equal('less than a second', tim.humanize(0.4))
    assert_equal('1 second', tim.humanize(1))
    assert_equal('1 minute 1 second', tim.humanize(61))
  end

  def test_zero_units
    assert_equal('1 hour 1 second', Timer.new.humanize(3601))
  end
end

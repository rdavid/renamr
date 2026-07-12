# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/timer'

# Defines tests for Timer.
class TestTimer < Minitest::Test
  def test_act
    assert_equal('less than a second', Timer.new.humanize(0.4))
  end
end

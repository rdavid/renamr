# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/utils'

# Defines tests for Utils.
class TestUtils < Minitest::Test
  def test_act
    assert_equal('abcde~qrst', Utils.trim('abcdefghijklmnopqrst', 10))
    assert_equal('abc', Utils.trim('abc', 10))
  end
end

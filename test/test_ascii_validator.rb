# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/ascii_validator'

# Defines tests for ASCIIValidatorAction.
class TestASCIIValidator < Minitest::Test
  def setup
    @act = Renamr::ASCIIValidatorAction.new
  end

  def test_act
    assert_equal('abc-9', @act.do(+'abc-9'))
  end

  def test_non_ascii
    assert_raises(RuntimeError) { @act.do(+'абв') }
  end
end

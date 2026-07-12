# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/omit'

# Defines tests for OmitAction.
class TestOmit < Minitest::Test
  def setup
    @act = Renamr::OmitAction.new(5)
  end

  def test_act
    assert_nil(@act.do(+'abc'))
    assert_equal('abcdef', @act.do(+'abcdef'))
  end
end

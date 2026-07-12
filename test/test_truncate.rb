# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/truncate'

# Defines tests for TruncateAction.
class TestTruncate < Minitest::Test
  def setup
    @act = Renamr::TruncateAction.new(10)
  end

  def test_act
    assert_equal('short.txt', @act.do(+'short.txt'))
    assert_equal('aaaaaa.txt', @act.do("#{'a' * 20}.txt"))
  end
end

# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/downcase'

# Defines tests for DowncaseAction.
class TestDowncase < Minitest::Test
  def setup
    @act = Renamr::DowncaseAction.new
  end

  def test_act
    assert_equal('file-9', @act.do(+'File-9'))
  end
end

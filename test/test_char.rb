# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2020-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/char'

class TestChar < Minitest::Test
  def setup
    @act = Renamr::CharAction.new
  end

  def test_act
    assert_equal('-' * 32,
                 @act.do(' (){},~–\'![]_#@=„“”"`—+‘’;·‡«»%…'.dup))
  end
end

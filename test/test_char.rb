# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2020-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/char'

class TestChar < Minitest::Test
  def setup
    @act = Renamr::CharAction.new
  end

  def test_act
    assert_equal('-' * 32,
                 @act.do(+' (){},~–\'![]_#@=„“”"`—+‘’;·‡«»%…'))
  end
end

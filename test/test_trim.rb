# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2020 David Rabkin

require 'minitest/autorun'
require_relative '../lib/renamr/trim'

class TestTrim < Minitest::Test
  def setup
    @act = Renamr::TrimAction.new
  end

  def test_act
    assert_equal('-', @act.do('-'.dup))
    assert_equal('-', @act.do('--'.dup))
    assert_equal('1', @act.do('1-'.dup))
    assert_equal('1', @act.do('-1'.dup))
    assert_equal('1-1', @act.do('-1--1-'.dup))
  end
end

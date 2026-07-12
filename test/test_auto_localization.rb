# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/auto_localization'

# Defines tests for AutoLocalizationAction.
class TestAutoLocalization < Minitest::Test
  def setup
    @act = Renamr::AutoLocalizationAction.new
  end

  def test_act
    assert_equal('ecole', @act.do(+'école'))
    assert_equal('', @act.do(+'日本'))
  end
end

# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require_relative '../lib/renamr/manual_localization'

# Defines tests for ManualLocalizationAction.
class TestManualLocalization < Minitest::Test
  def setup
    @act = Renamr::ManualLocalizationAction.new
  end

  def test_act
    assert_equal('Zurich Ae', @act.do(+'Žürich Àé'))
  end
end

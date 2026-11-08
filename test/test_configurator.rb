# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'minitest/autorun'
require 'tmpdir'
require_relative '../lib/renamr/configurator'

# Defines tests for Configurator.
class TestConfigurator < Minitest::Test
  # Parses arg as the command line. Sets the width, since the default reads
  # it from the terminal.
  def cfg(*arg)
    ARGV.replace(['--wid', '20', *arg])
    Renamr::Configurator.new
  end

  def test_defaults
    c = cfg

    assert_equal(Dir.pwd, c.dir)
    assert_equal(20, c.wid)
    refute_predicate(c, :act?)
    refute_predicate(c, :rec?)
    assert_nil(c.src)
  end

  def test_flags
    Dir.mktmpdir do |dir|
      c = cfg('--act', '--rec', '--mod', '--lim', '--dir', dir)

      %i[act? rec? mod? lim?].each { |k| assert_predicate(c, k) }
      assert_equal(File.expand_path(dir), c.dir)
    end
  end

  def test_lists
    c = cfg('--cut', '2,3', '--prepend', 'x-')

    assert_equal(%w[2 3], [c.pos, c.len])
    assert_equal(['x-', 0], [c.pre, c.beg])
    c = cfg('--prepend', 'x-,5')

    assert_equal(['x-', 5], [c.pre, c.beg])
  end

  def test_validation
    assert_raises(RuntimeError) { cfg('--dir', '/no/such/dir') }
    assert_raises(RuntimeError) { cfg('--wid', '10') }
    assert_raises(OptionParser::InvalidOption) { cfg('--bad') }
  end
end

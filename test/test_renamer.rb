# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'fileutils'
require 'minitest/autorun'
require 'tmpdir'
require_relative '../lib/renamr'

# Defines end-to-end tests for Renamer on a temporary directory.
class TestRenamer < Minitest::Test
  # Runs renamr with arg on dir and hides its report.
  def run_renamr(dir, *arg)
    ARGV.replace(['--wid', '60', '--dir', dir, *arg])
    capture_io { Renamr::Renamer.new.do }
  end

  # Writes each name in dir with the name itself as its content.
  def write(dir, *nme)
    nme.each { |n| File.write(File.join(dir, n), n) }
  end

  def test_preview
    Dir.mktmpdir do |dir|
      write(dir, 'A B.txt')
      run_renamr(dir)

      assert_equal(['A B.txt'], Dir.children(dir))
    end
  end

  def test_act
    Dir.mktmpdir do |dir|
      write(dir, 'A B.txt', '.Hidden File')
      run_renamr(dir, '--act')

      assert_equal(['.Hidden File', 'a-b.txt'], Dir.children(dir).sort)
      assert_equal('A B.txt', File.read(File.join(dir, 'a-b.txt')))
    end
  end

  def test_collision
    Dir.mktmpdir do |dir|
      write(dir, 'x y.txt', 'x-y.txt')
      run_renamr(dir, '--act')

      assert_equal(['x-y-0.txt', 'x-y.txt'], Dir.children(dir).sort)
      assert_equal('x y.txt', File.read(File.join(dir, 'x-y-0.txt')))
      assert_equal('x-y.txt', File.read(File.join(dir, 'x-y.txt')))
    end
  end

  def test_rec
    Dir.mktmpdir do |dir|
      sub = File.join(dir, 'Sub Dir')
      Dir.mkdir(sub)
      write(sub, 'In File.txt')
      run_renamr(dir, '--act')

      assert_equal(['In File.txt'], Dir.children(File.join(dir, 'sub-dir')))
      run_renamr(dir, '--act', '--rec')

      assert_equal(['in-file.txt'], Dir.children(File.join(dir, 'sub-dir')))
    end
  end
end

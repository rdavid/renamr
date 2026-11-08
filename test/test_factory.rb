# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'fileutils'
require 'minitest/autorun'
require 'tmpdir'
require_relative '../lib/renamr/factory'

# Defines tests for ActionsFactory and the whole action pipeline.
class TestFactory < Minitest::Test
  # Stands in for Configurator with every optional step unset.
  class Cfg
    attr_reader :pos, :len, :src, :dst, :pre, :beg

    def initialize(lim: false)
      @lim = lim
    end

    def lim?
      @lim
    end

    def mod?
      false
    end
  end

  # Creates nme in dir and runs it through the pipeline, as Renamer does.
  def run_pipeline(dir, nme, lim: false)
    FileUtils.touch(File.join(dir, nme))
    act = Renamr::ActionsFactory.new(Cfg.new(lim: lim)).produce(dir)
    nme = +nme
    act.each { |a| a.set(nme) }
    act.each { |a| break if (nme = a.do(nme)).nil? } # rubocop:disable Style/CombinableLoops
    nme
  end

  def test_normalize
    Dir.mktmpdir do |dir|
      {
        'My Résumé (Final).PDF' => 'my-resume-final.pdf',
        'Tom & Jerry.mp4' => 'tom-and-jerry.mp4',
        'Отчёт за май.docx' => 'otchjot-za-may.docx',
        'Report 02-11-2020.txt' => 'report-20201102.txt',
        'a.b.c.txt' => 'a-b-c.txt',
        '--Odd  Name--.txt' => 'odd-name.txt'
      }.each { |src, dst| assert_equal(dst, run_pipeline(dir, src)) }
    end
  end

  def test_directory
    Dir.mktmpdir do |dir|
      Dir.mkdir(File.join(dir, 'Old.Photos'))
      act = Renamr::ActionsFactory.new(Cfg.new).produce(dir)
      nme = +'Old.Photos'
      act.each { |a| nme = a.do(nme) }

      assert_equal('old-photos', nme)
    end
  end

  def test_lim
    Dir.mktmpdir do |dir|
      assert_nil(run_pipeline(dir, 'Short Name.txt', lim: true))
      out = run_pipeline(dir, "#{'a' * 200}.txt", lim: true)

      assert_equal(Renamr::ActionsFactory::LIMIT, out.length)
      assert(out.end_with?('.txt'))
    end
  end
end

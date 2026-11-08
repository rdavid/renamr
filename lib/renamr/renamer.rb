# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'fileutils'
require_relative 'configurator'
require_relative 'factory'
require_relative 'reporter'

module Renamr
  # Renames files using configured rules.
  class Renamer
    def initialize
      @cfg = Configurator.new
      @fac = ActionsFactory.new(@cfg)
    end

    # Renames each source to its destination when the act option is set, then
    # prints the report. Reports a failure and keeps going on errors.
    def move(dir, dat) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      rep = Reporter.new(File.expand_path(dir))
      dat.each do |src, dst|
        if src == dst
          rep.add(File.basename(src), '')
          next
        end
        begin
          File.rename(src, dst) if @cfg.act?
          rep.add(File.basename(src), File.basename(dst))
        rescue StandardError => e
          rep.add(File.basename(src), e)
          msg = ": #{e}"
          msg += " (#{e.class})" if e.class
          msg += "\n\t#{e.backtrace.join("\n\t")}"
          puts msg
        end
      end
      rep.do
    end

    # Returns true when nme is taken in the directory of src. A name is taken
    # when an earlier source moves to it, which dst lists, or when a file
    # other than src already has it on disk.
    def held?(dst, src, nme)
      pth = File.join(File.dirname(src), nme)
      dst.include?(nme) || (File.exist?(pth) && !File.identical?(src, pth))
    end

    # Appends an increasing index to the name until it is no longer taken.
    def unique(dat, src, nme)
      dst = dat.map { |_, d| File.basename(d) }
      return nme unless held?(dst, src, nme)

      ext = File.extname(nme)
      0.step do |i|
        n = "#{File.basename(nme, ext)}-#{i}#{ext}"
        return n unless held?(dst, src, n)
      end
    end

    # Computes new names for the entries of dir and passes them to move.
    # Skips hidden entries and the names that an action drops. Descends into
    # subdirectories when the rec option is set.
    def do_dir(dir) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
      raise "No such directory: #{dir}." unless File.directory?(dir)

      dat = []
      act = @fac.produce(dir)

      Dir.entries(dir).reject { |f| f.start_with?('.') }.sort.each do |nme|
        src = File.join(dir, nme)
        do_dir(src) if @cfg.rec? && File.directory?(src)
        act.each { |a| a.set(nme) }
        act.each { |a| break if (nme = a.do(nme)).nil? } # rubocop:disable Style/CombinableLoops
        next if nme.nil?

        nme = unique(dat, src, nme)
        dat << [src, File.join(dir, nme)]
      end
      move(dir, dat) if dat.any?
    end

    def do
      Reporter.init(@cfg.act?, @cfg.wid)
      do_dir(@cfg.dir)
      Reporter.final
    end
  end
end

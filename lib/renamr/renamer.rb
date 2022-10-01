# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2021 David Rabkin

require 'fileutils'
require_relative 'configurator'
require_relative 'factory'
require_relative 'reporter'

module Renamr
  # Renames file by certain rules.
  class Renamer
    def initialize
      @cfg = Configurator.new
      @fac = ActionsFactory.new(@cfg)
    end

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
          puts e.backtrace.join("\n\t")
                .sub("\n\t", ": #{e}#{e.class ? " (#{e.class})" : ''}\n\t")
        end
      end
      rep.do
    end

    def unique(dat, nme)
      dst = []
      dat.each { |_, d| dst << File.basename(d) }
      return nme unless dst.include?(nme)

      ext = File.extname(nme)
      0.step do |i| # Infinitive loop with index.
        n = ext.nil? ? "#{nme}-#{i}" : "#{File.basename(nme, ext)}-#{i}#{ext}"
        return n unless dst.include?(n)
      end
    end

    def do_dir(dir) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
      raise "No such directory: #{dir}." unless File.directory?(dir)

      dat = []
      act = @fac.produce(dir)
      # Doesn't include hidden files.
      Dir.entries(dir).reject { |f| f.start_with?('.') }.sort.each do |nme|
        src = File.join(dir, nme)
        do_dir(src) if @cfg.rec? && File.directory?(src)
        act.each { |a| a.set(nme) }
        act.each { |a| break if (nme = a.do(nme)).nil? } # rubocop:disable Style/CombinableLoops
        next if nme.nil?

        nme = unique(dat, nme)
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

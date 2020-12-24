# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018 by David Rabkin

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

    def move(dir, dat) # rubocop:disable MethodLength, AbcSize
      rep = Reporter.new(File.expand_path(dir))
      dat.each do |src, dst|
        if src == dst
          rep.add(File.basename(src), '')
          next
        end
        begin
          FileUtils.mv(src, dst) if @cfg.act?
          rep.add(File.basename(src), File.basename(dst))
        rescue StandardError => e
          rep.add(File.basename(src), e)
          puts e.backtrace.join("\n\t")
                .sub("\n\t", ": #{e}#{e.class ? " (#{e.class})" : ''}\n\t")
        end
      end
      rep.do
    end

    def do_dir(dir) # rubocop:disable MethodLength, CyclomaticComplexity, AbcSize
      raise "No such directory: #{dir}." unless File.directory?(dir)

      dat = []
      act = @fac.produce(dir)
      (Dir.entries(dir) - ['.', '..']).sort.each do |nme|
        src = File.join(dir, nme)
        do_dir(src) if @cfg.rec? && File.directory?(src)
        act.each { |a| a.set(nme) }
        act.each { |a| break if (nme = a.do(nme)).nil? }
        dat << [src, File.join(dir, nme)] unless nme.nil?
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

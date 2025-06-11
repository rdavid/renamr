# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'optparse'

module Renamr
  # Handles input parameters.
  class Configurator
    DIC = [
      ['-a', '--act',     'Real renaming.',              :act],
      ['-r', '--rec',     'Passes recursively.',         :rec],
      ['-l', '--lim',     'Limits name length.',         :lim],
      ['-m', '--mod',     'Prepends modification time.', :mod],
      ['-d', '--dir dir', 'Directory to rename.',        :dir],
      ['-s', '--src src', 'A string to substitute.',     :src],
      ['-t', '--dst dst', 'A string to replace to.',     :dst],
      ['-w', '--wid wid', 'Width of the table.',         :wid]
    ].freeze

    def add_cut(opt)
      opt.on('-c', '--cut pos,len', Array, 'Removes symbols from pos.') do |l|
        @options[:pos] = l[0]
        @options[:len] = l[1]
      end
    end

    def add_prepend(opt)
      opt.on('-p', '--prepend str,beg', Array, 'Prepend a string.') do |l|
        @options[:pre] = l[0]
        @options[:beg] = l[1].nil? ? 0 : l[1].to_i
      end
    end

    def add_version(opt)
      opt.on('-v', '--version', 'Show version.') do
        puts "#{File.basename($PROGRAM_NAME)} #{VERSION} #{DATE}"
        exit
      end
    end

    def add(opt)
      add_cut(opt)
      add_prepend(opt)
      add_version(opt)
    end

    def initialize
      @options = {}
      OptionParser.new do |o|
        o.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]."
        DIC.each { |f, p, d, k| o.on(f, p, d) { |i| @options[k] = i } }
        add(o)
      end.parse!
      validate
    end

    def validate
      if dir.nil?
        @options[:dir] = Dir.pwd
      else
        raise "No such directory: #{dir}." unless File.directory?(dir)

        @options[:dir] = File.expand_path(dir)
      end
      raise "Width of the table should exceeds 14 symbols: #{wid}." if wid < 15
    end

    def act?
      @options[:act]
    end

    def rec?
      @options[:rec]
    end

    def lim?
      @options[:lim]
    end

    def mod?
      @options[:mod]
    end

    def dir
      @options[:dir]
    end

    def src
      @options[:src]
    end

    def dst
      @options[:dst]
    end

    def pre
      @options[:pre]
    end

    def beg
      @options[:beg]
    end

    def pos
      @options[:pos]
    end

    def len
      @options[:len]
    end

    def wid
      if @options[:wid].nil?
        # Reads current terminal width.
        wid = `tput cols`
        wid.to_s.empty? ? 79 : wid.to_i
      else
        @options[:wid].to_i
      end
    end
  end
end

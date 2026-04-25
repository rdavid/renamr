# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'optparse'

module Renamr
  # Parses and validates command-line options.
  class Configurator
    DIC = [
      ['-a', '--act',     'Performs actual renaming.',          :act],
      ['-d', '--dir dir', 'Directory to process.',              :dir],
      ['-l', '--lim',     'Limits file name length.',           :lim],
      ['-m', '--mod',     'Prepends file modification time.',   :mod],
      ['-r', '--rec',     'Processes directories recursively.', :rec],
      ['-s', '--src src', 'String to replace.',                 :src],
      ['-t', '--dst dst', 'Replacement string.',                :dst],
      ['-w', '--wid wid', 'Output table width.',                :wid]
    ].freeze

    def add_simple(opt, key)
      f, p, d = DIC.find { |_, _, _, k| k == key }
      opt.on(f, p, d) { |i| @options[key] = i }
    end

    def add_cut(opt)
      opt.on('-c', '--cut pos,len', Array, 'Removes len characters starting at pos.') do |l|
        @options[:pos] = l[0]
        @options[:len] = l[1]
      end
    end

    def add_prepend(opt)
      opt.on('-p', '--prepend str,beg', Array, 'Prepends a string.') do |l|
        @options[:pre] = l[0]
        @options[:beg] = l[1].nil? ? 0 : l[1].to_i
      end
    end

    def add_version(opt)
      opt.on('-v', '--version', 'Shows the version.') do
        puts "#{File.basename($PROGRAM_NAME)} #{VERSION} #{DATE}"
        exit
      end
    end

    def add(opt)
      add_simple(opt, :act)
      add_cut(opt)
      add_simple(opt, :dir)
      add_simple(opt, :lim)
      add_simple(opt, :mod)
      add_prepend(opt)
      add_simple(opt, :rec)
      add_simple(opt, :src)
      add_simple(opt, :dst)
      add_version(opt)
      add_simple(opt, :wid)
    end

    def initialize
      @options = {}
      OptionParser.new do |o|
        o.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]."
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
      raise "Table width must be at least 15 characters: #{wid}." if wid < 15
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

        # Reads the current terminal width.
        wid = `tput cols`
        wid.to_s.empty? ? 79 : wid.to_i
      else
        @options[:wid].to_i
      end
    end
  end
end

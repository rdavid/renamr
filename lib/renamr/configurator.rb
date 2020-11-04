# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-present David Rabkin

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
      ['-p', '--pre pre', 'A string to prepend to.',     :pre],
      ['-w', '--wid wid', 'Width of the table.',         :wid]
    ].freeze

    def add(opt)
      opt.on('-c', '--cut pos,len', Array, 'Removes symbols from pos.') do |l|
        @options[:pos] = l[0]
        @options[:len] = l[1]
      end
      opt.on('-v', '--version', 'Show version.') do
        puts "#{File.basename($PROGRAM_NAME)} #{VERSION} #{DATE}"
        exit
      end
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
      raise "Width of the table should exeeds 14 symbols: #{wid}." if wid < 15
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

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2022 David Rabkin

require 'terminal-table'
require_relative 'action'
require_relative 'utils'

module Renamr
  # Formats and prints output data.
  class Reporter
    @@tim = Timer.new
    @@sta = { moved: 0, unaltered: 0, failed: 0 }

    def self.init(act, wid)
      @@act = act
      @@tbl = wid
      @@ttl = wid - 4
      @@str = (wid - 7) / 2
    end

    def initialize(dir)
      @dir = dir
      @row = []
    end

    def add(lhs, rhs)
      if rhs.is_a?(StandardError)
        tag = :failed
        rhs = "#{rhs.message} (#{rhs.class})"
      elsif rhs == ''
        tag = :unaltered
      else
        tag = :moved
      end
      @@sta[tag] += 1
      @row << [Utils.trim(lhs, @@str), Utils.trim(rhs, @@str)]
    end

    def do
      puts Terminal::Table.new(
        title: Utils.trim(@dir, @@ttl),
        headings: [
          { value: 'src', alignment: :center },
          { value: 'dst', alignment: :center }
        ],
        rows: @row,
        style: { width: @@tbl }
      )
    end

    def self.stat_out
      out = ''
      @@sta.each do |k, v|
        out += ' ' + v.to_s + ' ' + k.to_s + ',' if v.positive?
      end
      out.chop
    end

    def self.final
      msg = "#{@@act ? 'Real' : 'Test'}:#{stat_out} in #{@@tim.read}."
      msg = Utils.trim(msg, @@ttl)
      puts "| #{msg}#{' ' * (@@ttl - msg.length)} |\n+-#{'-' * @@ttl}-+"
    end
  end
end

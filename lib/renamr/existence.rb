# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-present David Rabkin

require_relative 'action'

module Renamr
  # Adds number from 0 to 9 in case of file existence.
  class ExistenceAction < Action
    ITERATION = 10

    def initialize(dir, lim)
      raise 'dir cannot be nil.' if dir.nil?
      raise 'lim cannot be nil.' if lim.nil?

      @dir = dir
      @lim = lim
    end

    def do(src) # rubocop:disable MethodLength, CyclomaticComplexity, AbcSize
      raise 'ExistenceAction needs original file name.' if @src.nil?
      return src if src == @src
      return src unless File.exist?(File.join(@dir, src))

      if src.length == @lim
        ext = File.extname(src)
        src = src[0..@lim - ext.length - ITERATION.to_s.length + 1]
        src << ext
      end
      nme = File.basename(src, '.*')
      nme = '' if nme.length == 1
      ext = File.extname(src)
      (0..ITERATION).each do |i|
        n = File.join(@dir, nme + i.to_s + ext)
        return n unless File.exist?(n)
      end
      raise "Unable to compose a new name: #{src}."
    end

    def set(src)
      @src = src
    end
  end
end

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2022 David Rabkin

require_relative 'action'

module Renamr
  # All points besides extention are replaced by minus.
  class PointAction < Action
    def initialize(dir)
      raise 'dir cannot be nil.' if dir.nil?

      @dir = dir
    end

    def do(src)
      if File.file?(File.join(@dir, src))
        p2m(File.basename(src, '.*')) << File.extname(src)
      else
        p2m(src)
      end
    end
  end
end

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 David Rabkin

require_relative 'action'

module Renamr
  # Substitutes a string with a string.
  class SubstituteAction < Action
    def initialize(src, dst)
      raise 'src cannot be nil.' if src.nil?

      # The action works after PointAction. All points are replaces with minus.
      @src = p2m(src)
      @dst = dst.nil? ? '-' : p2m(dst)
    end

    def do(src)
      src.gsub(@src, @dst)
    end
  end
end

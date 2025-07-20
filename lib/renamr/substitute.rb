# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Substitutes a string with a string.
  class SubstituteAction < Action
    def initialize(src, dst)
      super
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

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Limits file length.
  class TruncateAction < Action
    def initialize(lim)
      super()
      raise 'lim cannot be nil.' if lim.nil?

      @lim = lim
    end

    def do(src)
      return src unless src.length > @lim

      ext = File.extname(src)
      len = ext.length
      dst = len >= @lim ? ext[0..@lim - 1] : src[0..@lim - 1 - len] << ext
      dst.gsub!(/-$/, '')
      dst.gsub!('-.', '.')
      dst
    end
  end
end

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Replaces dots with hyphens, except for the file extension separator.
  class PointAction < Action
    def initialize(dir)
      super()
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

# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Skips file names shorter than the limit.
  class OmitAction < Action
    def initialize(lim)
      super()
      raise 'lim cannot be nil.' if lim.nil?

      @lim = lim
    end

    def do(src)
      src.length < @lim ? nil : src
    end
  end
end

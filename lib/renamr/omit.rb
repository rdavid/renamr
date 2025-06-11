# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Omits file names shorter than limit.
  class OmitAction < Action
    def initialize(lim)
      raise 'lim cannot be nil.' if lim.nil?

      @lim = lim
    end

    def do(src)
      src.length < @lim ? nil : src
    end
  end
end

# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 by David Rabkin

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

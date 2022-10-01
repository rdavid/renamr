# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 by David Rabkin

require_relative 'action'

module Renamr
  # Removes symbols between left and right positions.
  class RemoveAction < Action
    def initialize(pos, len)
      raise 'len cannot bi nil.' if len.nil?
      raise 'pos cannot be nil.' if pos.nil?
      raise 'pos has to be positive.' unless pos.to_i.positive?

      @pos = pos.to_i
      @len = len.to_i
    end

    def do(src)
      return src[@len..-1] if @pos == 1

      src[0..@pos - 1] + src[@pos + @len..-1]
    end
  end
end

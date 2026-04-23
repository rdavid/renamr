# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Removes a substring by 1-based position and length.
  class RemoveAction < Action
    def initialize(pos, len)
      super()
      raise 'len cannot bi nil.' if len.nil?
      raise 'pos cannot be nil.' if pos.nil?
      raise 'pos has to be positive.' unless pos.to_i.positive?

      @pos = pos.to_i
      @len = len.to_i
    end

    def do(src)
      return src[@len..] if @pos == 1

      src[0..(@pos - 1)] + src[(@pos + @len)..]
    end
  end
end

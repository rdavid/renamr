# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Prepends a user-provided pattern.
  class PrependAction < Action
    def initialize(beg, pre) # rubocop:disable Lint/MissingSuper
      raise 'beg cannot be nil.' if beg.nil?
      raise 'pre cannot be nil.' if pre.nil?

      @beg = beg
      @pre = pre
    end

    def do(src)
      src.insert(@beg, @pre)
    end
  end
end

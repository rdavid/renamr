# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Replaces special symbols with hyphens, except `.`, `&`, and `$`.
  class CharAction < Action
    SYM = ' (){},~–\'![]_#@=„“”"`—+‘’;·‡«»%…'.chars.to_set.freeze

    def do(src)
      src.chars.map { |s| SYM.include?(s) ? '-' : s }.join
    end
  end
end

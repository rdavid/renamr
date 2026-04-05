# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Replaces special symbols with minus signs, except `.`, `&`, and `$`.
  class CharAction < Action
    SYM = ' (){},~–\'![]_#@=„“”"`—+‘’;·‡«»%…'.chars.to_set.freeze

    def do(src)
      src.chars.map { |s| SYM.include?(s) ? '-' : s }.join
    end
  end
end

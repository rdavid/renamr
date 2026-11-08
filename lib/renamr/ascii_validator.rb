# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Raises an error when a name still holds non-ASCII characters after the
  # earlier actions. It guards against renaming to an unexpected result.
  class ASCIIValidatorAction < Action
    def do(src)
      ascii = src.chars.select(&:ascii_only?).join
      raise "String #{src} contains non-ASCII characters." if src != ascii

      src
    end
  end
end

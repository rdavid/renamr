# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018 by David Rabkin

require_relative 'action'

module Renamr
  # Checks if the resulted string has only ASCII symbols.
  class ASCIIValidatorAction < Action
    def do(src)
      ascii = src.chars.select(&:ascii_only?).join
      raise "String #{src} has non-ASCII symbols." if src != ascii

      src
    end
  end
end

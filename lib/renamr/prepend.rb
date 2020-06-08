# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-present David Rabkin

require_relative 'action'

module Renamr
  # Prepends user patter.
  class PrependAction < Action
    def initialize(pat)
      raise 'pat cannot be nil.' if pat.nil?

      @pat = pat
    end

    def do(src)
      src.prepend(@pat)
    end
  end
end

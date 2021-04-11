# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018 by David Rabkin

require_relative 'action'

module Renamr
  # Prepends user patter.
  class PrependAction < Action
    def initialize(beg, pre) # rubocop:disable Lint/MissingSuper
      raise 'beg cannot be nil.' if beg.nil?
      raise 'ins cannot be nil.' if pre.nil?

      @beg = beg
      @pre = pre
    end

    def do(src)
      src.insert(@beg, @pre)
    end
  end
end
